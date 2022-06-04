#include "printk.h"
#include "panic.h"

void panic(const char *s) {
    printk("panic: %s\n", s);
    while (1);
}