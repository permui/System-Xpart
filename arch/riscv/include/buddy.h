#ifndef _BUDDY_H
#define _BUDDY_H

#include "types.h"


/**
 * len(b) = size * 2 - 1. b[0, size * 2 - 2].
 * For node i, b[i] is the largest "whole node" in its subtree.
 * If a node is allocated, its subtree is left unmodified.
 */
struct buddy {
  uint64 size;
  uint64 *b; 
};

void init_buddy_system(void);
void *alloc_pages(uint64);
void free_pages(void*);

#endif