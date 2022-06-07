#include "types.h"
#include "sbi.h"

// There is something very strange here.
// According to the RISCV-SBI document,
// sbi call return : a0 - the error code, a1 - the return value.
// But I tested and found that a0 is the return value, while a1 is 0, which looks like an error code.
// So I change "output" in inline asm.
struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
			            uint64 arg1, uint64 arg2,
			            uint64 arg3, uint64 arg4,
			            uint64 arg5) 
{
    struct sbiret ret;
    __asm__ volatile (
        "lw a7, %[ext]\n"
        "lw a6, %[fid]\n"
        "ld a0, %[arg0]\n"
        "ld a1, %[arg1]\n"
        "ld a2, %[arg2]\n"
        "ld a3, %[arg3]\n"
        "ld a4, %[arg4]\n"
        "ld a5, %[arg5]\n"
        "ecall\n"
        "sd a0, %[ret_0]\n"
        "sd a1, %[ret_1]\n"
        : [ret_0] "=m" (ret.value), [ret_1] "=m" (ret.error) 
        : [ext] "m" (ext), [fid] "m" (fid),
          [arg0] "m" (arg0), [arg1] "m" (arg1),
          [arg2] "m" (arg2), [arg3] "m" (arg3),
          [arg4] "m" (arg4), [arg5] "m" (arg5)
        : "memory"
    );
    return ret;
}
