#include "printk.h"
#include "sbi.h"
#include "proc.h"

extern void test();

int start_kernel() {
    printk("%d\n", 2022);
    printk("Hello RISC-V\n");

    schedule();

    test();

	return 0;
}
