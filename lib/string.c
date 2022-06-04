#include "string.h"
#include "types.h"

void *memset(void *dst, char c, uint64 n) {
    char *cdst = (char *)dst;
    for (uint64 i = 0; i < n; ++i)
        cdst[i] = c;

    return dst;
}

void *memcpy(void *dst, const void *src, uint64 n) {
    char *cdst = (char *)dst;
    const char *csrc = (const char *)src;

    while (n--) {
        *cdst = *csrc;
        ++cdst, ++csrc;
    }

    return dst;
}
