#include "../include/syscall.h"
#include "stdio.h"

register void* current_sp __asm__("sp");

int main() {
    int T = 5;
    while (T--) {
        printf("[User] pid: %ld, sp is %lx\n", getpid(), current_sp);
        for (unsigned int i = 0; i < 0xFFFFFF; i++);
    }
    exit(0);
    // return 0;
}
