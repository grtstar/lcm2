#pragma once

#include <stdint.h>
#include <stdbool.h>

typedef struct shm_msg_t
{
    uint32_t size;
    uint32_t msg_num;
    char channel[256];
    uint8_t data[1024];        
}shm_msg_t;

typedef struct shm_msgr_t
{
    shm_msg_t msg;
    uint8_t *buff;
}shm_msgr_t;

typedef struct shm_header_t shm_t;

shm_t * shm_create(uint32_t size, bool sharem);
void shm_deinit(shm_t *header);
bool shm_publish(shm_t *header, const char *channel, const void *data, uint32_t datalen);
bool shm_read(shm_t *header, uint32_t msg_num, shm_msgr_t *msgr);