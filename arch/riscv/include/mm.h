#ifndef _MM_H_
#define _MM_H_

#include "types.h"

struct run {
    struct run *next;
};

// initialize memory service
void mm_init();

// allocate a page, return start pointer
uint64 kalloc();

// free the page that contains the input location
void kfreepage(uint64);

#endif