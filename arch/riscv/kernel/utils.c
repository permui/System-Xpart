#include "panic.h"
#include "utils.h"

uint64 max(uint64 x, uint64 y) {
    return x > y ? x : y;
}

void myassert(int b) {
    if (!b) panic("myassert fail");
}