#pragma once

#include "types.h"

void *memset(void *dst, char c, uint64 n);

void *memcpy(void *dst, const void *src, uint64 n);

uint64 strlen(const char *s);