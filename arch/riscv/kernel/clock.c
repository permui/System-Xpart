// clock.c

#include "types.h"
#include "sbi.h"
#include "clock.h"
#include "printk.h"

const uint64 TIMECLOCK = 1e6;

uint64 get_timer() {
    uint64 ret;
    __asm__ volatile (
        "rdtime %0"
        : "=r" (ret)
    );
    return ret;
}

void clock_set_next_event() {
    // uint64 nxt = get_timer() + TIMECLOCK;
    uint64 tim = get_timer();
    uint64 nxt = tim + TIMECLOCK;
    // printk("tim = %ld\n", tim);
    // printk("nxt clock interrupt = %ld\n", nxt);
    sbi_ecall(0x00, 0, nxt, 0, 0, 0, 0, 0);
}