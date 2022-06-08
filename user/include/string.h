#pragma once

#include "stddef.h"

char* gets(char *buf, int max);
void* memset(void *dst, int c, unsigned int n);
void* memcpy(void *dst, const void *src, size_t n);

int strcmp(const char *p, const char *q);