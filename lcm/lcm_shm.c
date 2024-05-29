#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>


#ifdef SO_TIMESTAMP
#define MSG_EXT_HDR
#endif

#include <glib.h>

#include "dbg.h"
#include "lcm.h"
#include "lcm_internal.h"
#include "udpm_util.h"

#include "ipcshm/ipcshm.h"

#define SELF_TEST_CHANNEL "LCM_SELF_TEST"

#define LF_ALIGN_UP(s, a)            (((s)+((a)-1))&~((a)-1))
#define LF_IS_POW2(s)                ((!!(s))&(!((s)&((s)-1))))


typedef struct _lcm_provider_t lcm_shm_t;
struct _lcm_provider_t {

    lcm_t *lcm;
    GStaticRecMutex mutex; /* Must be locked when reading/writing to the
                              above three queues */
    GStaticMutex transmit_lock;  // so that only thread at a time can transmit
    shm_t *shm;
    uint32_t msg_no;
};


void lcm_shm_destroy(lcm_shm_t *lcm)
{
    dbg(DBG_LCM, "closing lcm context\n");
    printf("lcm_shm_destroy: closing lcm context");
    shm_deinit(lcm->shm);
    free(lcm);
}

static int lcm_shm_get_fileno(lcm_shm_t *lcm)
{
    return -1;
}

static int lcm_shm_subscribe(lcm_shm_t *lcm, const char *channel)
{
    return 0;
}

static int lcm_shm_publish(lcm_shm_t *lcm, const char *channel, const void *data,
                            unsigned int datalen)
{
    bool succ = false;
    succ = shm_publish(lcm->shm, channel, data, datalen);
    return succ ? 0 : -1;
}

static int lcm_shm_handle(lcm_shm_t *lcm)
{
    shm_msgr_t msgr = {0};
    if(shm_read(lcm->shm, lcm->msg_no, &msgr))
    {
        printf("lcm_shm_handle: got msg: %d\n", msgr.msg.msg_num);

        lcm->msg_no = msgr.msg.msg_num;
        lcm_recv_buf_t rbuf;
        if(!msgr.buff)
        {
            rbuf.data = msgr.buff;
        }
        else 
        {
            rbuf.data = msgr.msg.data;
        }
        rbuf.data_size = msgr.msg.size;
        rbuf.recv_utime = lcm_timestamp_now();
        rbuf.lcm = lcm->lcm;
        lcm_dispatch_handlers(lcm->lcm, &rbuf, msgr.msg.channel);
        if(msgr.buff)
        {
            free(msgr.buff);
        }
    }
    else
    {
        usleep(10);
    }
    return 0;
}

static void self_test_handler(const lcm_recv_buf_t *rbuf, const char *channel, void *user)
{
    int *result = (int *) user;
    *result = 1;
}

static int shm_self_test(lcm_shm_t *lcm)
{
}

lcm_provider_t *lcm_shm_create(lcm_t *parent, const char *network, const GHashTable *args)
{
    lcm_shm_t *self = (lcm_shm_t *) calloc(1, sizeof(lcm_shm_t));
    self->lcm = parent;
    self->msg_no = 0;
    self->shm = shm_create(4*1024*1024, true);
    if(!self->shm)
    {
        perror("shm_create failed\n");
        free(self);
        return NULL;
    }
    return self;
}

#ifdef WIN32
static lcm_provider_vtable_t shm_vtable;
#else
static lcm_provider_vtable_t shm_vtable = {
    .create = lcm_shm_create,
    .destroy = lcm_shm_destroy,
    .subscribe = lcm_shm_subscribe,
    .unsubscribe = NULL,
    .publish = lcm_shm_publish,
    .handle = lcm_shm_handle,
    .get_fileno = lcm_shm_get_fileno,
};
#endif

static lcm_provider_info_t shm_info;

void lcm_shm_provider_init(GPtrArray *providers)
{
    shm_info.name = "ipcshm";
    shm_info.vtable = &shm_vtable;

    g_ptr_array_add(providers, &shm_info);
}
