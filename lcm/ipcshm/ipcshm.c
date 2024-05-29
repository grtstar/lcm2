#include <pthread.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <assert.h>

#include "ipcshm.h"

#define max(a,b)    (((a) > (b)) ? (a) : (b)) 
#define min(a,b)    (((a) < (b)) ? (a) : (b)) 

typedef struct shm_fifo_t
{
    uint32_t size;		
    uint32_t in;		
    uint32_t out;		
    uint8_t  data[0];
}shm_fifo_t;

#define SHM_MAGIC   0x12345678
#define MEM_MAGIC   0x87654321

typedef struct shm_header_t
{
    uint32_t magic;
    pthread_mutex_t mutex;
    uint32_t last_msg_num;
    shm_fifo_t fifo;
}shm_header_t;


//消息存入
static int _fifo_put(shm_fifo_t *fifo, void *items, uint32_t len)
{
    uint8_t *buffer = (uint8_t *)items;	//获取当前消息数据载入缓冲区
    // 获取 fifo 中空闲长度 
    len = min(len, fifo->size - fifo->in + fifo->out);
	//获取fifo 当前存入in的位置
    uint32_t l = min(len, fifo->size - (fifo->in & (fifo->size - 1)));
    //载入的buffer数据到_msgfifo队列中，存入in 位置 超出后回到 size 的 0 位置，循环这样
	memcpy((uint8_t *)fifo->data + (fifo->in & (fifo->size - 1)), buffer, l);
    memcpy(fifo->data, buffer + l , (len - l));
    fifo->in += len; //将 fifo载入的位置 in 更新
    return len; //返回len长度
}
//fifo消息出列
static int _fifo_get(shm_fifo_t *fifo, void *items, uint32_t len)
{
	//映射指向地址变量
    uint8_t *buffer = (uint8_t *)items;
    // 获取 fifo 中非空闲长度 
    len = min(len, fifo->in - fifo->out);
    //获取 fifo当前出列到out位置
    uint32_t l = min(len, fifo->size - (fifo->out & (fifo->size - 1)));
    // 复制从 fifo->out 到尾部的数据
    memcpy(buffer, (uint8_t*)fifo->data + (fifo->out & (fifo->size - 1)), l);
    // 复制剩下的数据
    memcpy(buffer + l, fifo->data, (len - l));
    fifo->out += len; //将 fifo 出列的位置 out 更新
    return len;	//返回len长度
}

static int _fifo_touch(shm_fifo_t *fifo, int pos, void *items, uint32_t len)
{
	//映射指向地址变量
    uint8_t *buffer = (uint8_t *)items;
    // 获取 fifo 中非空闲长度 
    uint32_t out = fifo->out + pos;
    len = min(len, fifo->in - out);
    //获取 fifo当前出列到out位置
    if(items != NULL)
    {
        uint32_t l = min(len, fifo->size - (out & (fifo->size - 1)));
        // 复制从 fifo->out 到尾部的数据
        memcpy(buffer, (uint8_t*)fifo->data + (out & (fifo->size - 1)), l);
        // 复制剩下的数据
        memcpy(buffer + l, fifo->data, (len - l));
    }
    return len;	//返回len长度
}

static int _fifo_drop(shm_fifo_t *fifo, uint32_t len)
{
    len = min(len, fifo->in - fifo->out);
    fifo->out += len;
    return len;
}

int fifo_get_remain_size(shm_fifo_t *fifo)
{
    return fifo->size - fifo->in + fifo->out;
}

bool fifo_is_empty(shm_fifo_t *fifo)
{
    return fifo->in == fifo->out;
}

shm_t * shm_create(uint32_t size, bool sharem)
{
    if(sharem)
    {
        int shm_fd = shm_open("/ipcshm", O_CREAT | O_RDWR, 0666);
        if (shm_fd == -1) {
            perror("shm_open");
            return NULL;
        }

        if (ftruncate(shm_fd, sizeof(shm_header_t) + size) == -1) {
            perror("ftruncate");
            close(shm_fd);
            return NULL;
        }

        shm_header_t *header = mmap(NULL, sizeof(shm_header_t) + size, PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
        if (header == MAP_FAILED) {
            perror("mmap");
            close(shm_fd);
            return NULL;
        }

        close(shm_fd);

        if(header->magic != SHM_MAGIC)
        {
            header->magic = SHM_MAGIC;
            header->last_msg_num = 0;
            header->fifo.size = size;
            header->fifo.in = 0;
            header->fifo.out = 0;
            pthread_mutexattr_t attr;
            pthread_mutexattr_init(&attr);
            pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
            pthread_mutex_init(&header->mutex, &attr);
        }
        return header;
    }
    else
    {
        shm_header_t *header = (shm_header_t *)malloc(sizeof(shm_header_t) + size);
        if(header == NULL)
        {
            return NULL;
        }
        header->magic = MEM_MAGIC;
        header->last_msg_num = 0;
        header->fifo.size = size;
        header->fifo.in = 0;
        header->fifo.out = 0;
        pthread_mutex_init(&header->mutex, NULL);
        return header;
    }
}

void shm_deinit(shm_t *header)
{
    if(header->magic == SHM_MAGIC)
    {
        munmap(header, sizeof(shm_header_t) + header->fifo.size);
    }
    else if(header->magic == MEM_MAGIC)
    {
        free(header);
    }
    else
    {
        assert(0);
    }
}

bool shm_publish(shm_t *header, const char *channel, const void *data, uint32_t datalen)
{
    assert(datalen <= header->fifo.size - sizeof(shm_msg_t));
    int len = strlen(channel);
    assert(len < 256);
    pthread_mutex_lock(&header->mutex);
    while(fifo_get_remain_size(&header->fifo) < datalen + sizeof(shm_msg_t))
    {
        shm_msg_t msg = {0};
        uint32_t len = _fifo_get(&header->fifo, &msg, sizeof(shm_msg_t));
        len = _fifo_drop(&header->fifo,  msg.size);
    }
    {
        shm_msg_t msg = {0};
        msg.size = datalen;
        strcpy(msg.channel, channel);
        msg.msg_num = ++ header->last_msg_num;
        _fifo_put(&header->fifo, &msg, sizeof(shm_msg_t));
        _fifo_put(&header->fifo, data, datalen);
    }
    pthread_mutex_unlock(&header->mutex);
    return true;
}

bool shm_read(shm_t *header, uint32_t msg_num, shm_msgr_t *msgr)
{
    pthread_mutex_lock(&header->mutex);
    if(header->last_msg_num == msg_num)
    {
        pthread_mutex_unlock(&header->mutex);
        return false;
    }
    shm_msg_t msg = {0};
    int pos = 0;
    while(true)
    {
        int len = _fifo_touch(&header->fifo, pos, &msg, sizeof(shm_msg_t));
        pos += len;
        if(msg.msg_num <= msg_num)
        {
            pos += msg.size;
        }
        else
        {
            if(msg.size < msgr->msg.size)
            {
                msgr->msg.size = msg.size;
                msgr->msg.msg_num = msg.msg_num;
                strcpy(msgr->msg.channel, msg.channel);
                _fifo_touch(&header->fifo, pos, msgr->msg.data, msg.size);
            }
            else
            {
                msgr->msg.size = msg.size;
                msgr->msg.msg_num = msg.msg_num;
                strcpy(msgr->msg.channel, msg.channel);
                msgr->buff = (uint8_t *)malloc(msg.size);
                _fifo_touch(&header->fifo, pos, msgr->buff, msg.size);
            }
            break;
        }
    }
    pthread_mutex_unlock(&header->mutex);
    return true;
}