#include "asm.h"

.extern trap_handler
.extern dummy

    .section .text.entry
    .align 2
    # why align 2 ?
    .globl _traps
_traps:

    csrrw t0, sscratch, t0
    bnez t0, _L1

    csrrw t0, sscratch, t0
    // now sscratch = 0,
    //     sp = kernel stack pointer
    j _save_context

_L1:
    // from U to S
    csrrw t0, sscratch, t0
    csrrw sp, sscratch, sp
    // now sscratch = user stack pointer,
    //     sp = kernel stack pointer

_save_context:
    addi sp, sp, -280

_save_ord_regs:
    REG_S x0, 0(sp)
    REG_S x1, 8(sp)
    REG_S x2, 16(sp)
    REG_S x3, 24(sp)
    REG_S x4, 32(sp)
    REG_S x5, 40(sp)
    REG_S x6, 48(sp)
    REG_S x7, 56(sp)
    REG_S x8, 64(sp)
    REG_S x9, 72(sp)
    REG_S x10, 80(sp)
    REG_S x11, 88(sp)
    REG_S x12, 96(sp)
    REG_S x13, 104(sp)
    REG_S x14, 112(sp)
    REG_S x15, 120(sp)
    REG_S x16, 128(sp)
    REG_S x17, 136(sp)
    REG_S x18, 144(sp)
    REG_S x19, 152(sp)
    REG_S x20, 160(sp)
    REG_S x21, 168(sp)
    REG_S x22, 176(sp)
    REG_S x23, 184(sp)
    REG_S x24, 192(sp)
    REG_S x25, 200(sp)
    REG_S x26, 208(sp)
    REG_S x27, 216(sp)
    REG_S x28, 224(sp)
    REG_S x29, 232(sp)
    REG_S x30, 240(sp)
    REG_S x31, 248(sp)

_save_special_regs:

    // now x0 ~ x31 can be freely used

    // save sepc to kernel stack
    csrr t0, sepc
    REG_S t0, 256(sp)
    
    // save sscratch to kernel stack and zero it
    csrrw t0, sscratch, zero
    REG_S t0, 264(sp)

    csrr t0, stval
    REG_S t0, 272(sp)

_call_trap_handler:

    csrr a0, scause
    mv a1, sp

    call trap_handler
    // no return value
    // for syscall, return value is in a0, a1

_restore_context:

    REG_L t0, 272(sp)
    csrw stval, t0

    // restore sscratch from kernel stack
    REG_L t0, 264(sp)
    csrw sscratch, t0

    // restore sepc from kernel stack
    REG_L t0, 256(sp)
    csrw sepc, t0

_restore_ord_regs:
    REG_L x0, 0(sp)
    REG_L x1, 8(sp)
    REG_L x2, 16(sp)
    REG_L x3, 24(sp)
    REG_L x4, 32(sp)
    REG_L x5, 40(sp)
    REG_L x6, 48(sp)
    REG_L x7, 56(sp)
    REG_L x8, 64(sp)
    REG_L x9, 72(sp)
    REG_L x10, 80(sp)
    REG_L x11, 88(sp)
    REG_L x12, 96(sp)
    REG_L x13, 104(sp)
    REG_L x14, 112(sp)
    REG_L x15, 120(sp)
    REG_L x16, 128(sp)
    REG_L x17, 136(sp)
    REG_L x18, 144(sp)
    REG_L x19, 152(sp)
    REG_L x20, 160(sp)
    REG_L x21, 168(sp)
    REG_L x22, 176(sp)
    REG_L x23, 184(sp)
    REG_L x24, 192(sp)
    REG_L x25, 200(sp)
    REG_L x26, 208(sp)
    REG_L x27, 216(sp)
    REG_L x28, 224(sp)
    REG_L x29, 232(sp)
    REG_L x30, 240(sp)
    REG_L x31, 248(sp)

_restore_stack_pointer:

    addi sp, sp, 280

    csrrw t0, sscratch, t0
    bnez t0, _L2

    csrrw t0, sscratch, t0

    j _sret_from_traps

_L2:

    csrrw t0, sscratch, t0
    csrrw sp, sscratch, sp

_sret_from_traps:

    sret


    .global __dummy
__dummy:

    // swap sscratch <-> sp
    // after this
    //  sp points to USER_END, the initial user stack pointer place
    //  sscratch is the kernel stack pointer
    csrrw sp, sscratch, sp

    sret

    .global __switch_to
__switch_to:
    addi a0, a0, TASK_STRUCT_THREAD_OFFSET
    REG_S ra, 0(a0)
    REG_S sp, 8(a0)
    REG_S s0, 16(a0)
    REG_S s1, 24(a0)
    REG_S s2, 32(a0)
    REG_S s3, 40(a0)
    REG_S s4, 48(a0)
    REG_S s5, 56(a0)
    REG_S s6, 64(a0)
    REG_S s7, 72(a0)
    REG_S s8, 80(a0)
    REG_S s9, 88(a0)
    REG_S s10, 96(a0)
    REG_S s11, 104(a0)

    csrr t0, sepc
    REG_S t0, 112(a0)
    csrr t0, sstatus
    REG_S t0, 120(a0)
    csrr t0, sscratch
    REG_S t0, 128(a0)

    addi a1, a1, TASK_STRUCT_THREAD_OFFSET
    REG_L ra, 0(a1)
    REG_L sp, 8(a1)
    REG_L s0, 16(a1)
    REG_L s1, 24(a1)
    REG_L s2, 32(a1)
    REG_L s3, 40(a1)
    REG_L s4, 48(a1)
    REG_L s5, 56(a1)
    REG_L s6, 64(a1)
    REG_L s7, 72(a1)
    REG_L s8, 80(a1)
    REG_L s9, 88(a1)
    REG_L s10, 96(a1)
    REG_L s11, 104(a1)

    REG_L t0, 112(a1)
    csrw sepc, t0
    REG_L t0, 120(a1)
    csrw sstatus, t0
    REG_L t0, 128(a1)
    csrw sscratch, t0

    // switch page table
    addi a1, a1, TASK_STRUCT_THREAD_TO_PAGE_TABLE
    REG_L t0, 0(a1)
    srli t0, t0, 12
    li t1, (1 << 63)
    or t0, t0, t1
    csrw satp, t0
    sfence.vma zero, zero

    ret

    .global _ret_by_trapframe
    // child_ret_from_clone, sys_execve use this
_ret_by_trapframe:
    // a0 is the child's trapframe

    REG_L t0, 272(a0)
    csrw stval, t0

    // restore sscratch from kernel stack
    REG_L t0, 264(a0)
    csrw sscratch, t0

    // restore sepc from kernel stack
    REG_L t0, 256(a0)
    csrw sepc, t0

    REG_L x0, 0(a0)
    REG_L x1, 8(a0)
    # REG_L x2, 16(a0) sp should not be changed
    REG_L x3, 24(a0)
    REG_L x4, 32(a0)
    REG_L x5, 40(a0)
    REG_L x6, 48(a0)
    REG_L x7, 56(a0)
    REG_L x8, 64(a0)
    REG_L x9, 72(a0)
    # REG_L x10, 80(a0)
    REG_L x11, 88(a0)
    REG_L x12, 96(a0)
    REG_L x13, 104(a0)
    REG_L x14, 112(a0)
    REG_L x15, 120(a0)
    REG_L x16, 128(a0)
    REG_L x17, 136(a0)
    REG_L x18, 144(a0)
    REG_L x19, 152(a0)
    REG_L x20, 160(a0)
    REG_L x21, 168(a0)
    REG_L x22, 176(a0)
    REG_L x23, 184(a0)
    REG_L x24, 192(a0)
    REG_L x25, 200(a0)
    REG_L x26, 208(a0)
    REG_L x27, 216(a0)
    REG_L x28, 224(a0)
    REG_L x29, 232(a0)
    REG_L x30, 240(a0)
    REG_L x31, 248(a0)

    REG_L a0, 80(a0)

    csrrw sp, sscratch, sp

    sret