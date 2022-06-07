#include "baseio.h"
#include "sbi.h"

void putc(int c) {
    sbi_ecall(SBI_PUTCHAR_EID, 0, c, 0, 0, 0, 0, 0);
}

int getc() {
    // manual block, because sbi_console_getchar() does not block.
    while (1) {
        struct sbiret r = sbi_ecall(SBI_GETCHAR_EID, 0, 0, 0, 0, 0, 0, 0);
        if (r.value != -1) return r.value;
    }
}