#include "string.h"

#include "stdio.h"
#include "../include/syscall.h"

char *gets(char *buf, int max) {
    int i, cc;
    char c;

    for (i = 0; i + 1 < max;) {
        cc = read(0, &c, 1);
        if (cc == 0)
            continue;
        if (cc < 1)
            break;
        buf[i++] = c;
        if (c == '\n' || c == '\r')
            break;
    }
    buf[i - 1] = '\0';
    return buf;
}

void *memset(void *dst, int c, unsigned int n) {
    char *cdst = (char *)dst;
    int i;
    for (i = 0; i < n; i++) {
        cdst[i] = c;
    }
    return dst;
}

void *memcpy(void *dst, const void *src, size_t n) {
    char *cdst = (char *)dst;
    const char *csrc = (const char *)src;
    while (n--) {
        *cdst = *csrc;
        ++cdst, ++csrc;
    }
    return dst;
}

int strcmp(const char *p, const char *q) {
    while (*p && *p == *q)
        p++, q++;
    return (unsigned char)*p - (unsigned char)*q;
}