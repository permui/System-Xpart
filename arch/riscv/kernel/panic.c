#include "printk.h"
#include "panic.h"

void panic(const char *s) {
    printk("kernel panic: %s\n", s);
    while (1);
}