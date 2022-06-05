#include <consts.h>

.extern start_kernel
.extern mm_init
.extern task_init
.extern setup_vm_first
.extern setup_vm_second
.extern first_parge_table

    .section .text.init
    .globl _start
_start:

	la sp, boot_stack_top

    li t1, PA2VA_OFFSET
    la t0, _traps
    add t0, t0, t1
    csrw stvec, t0

    // open sstatus.SUM
    li t0, (1 << 18)
    csrs sstatus, t0

	call setup_vm_first  // build up first page table
	call relocate  // launch virtual memory

    call init_buddy_system  // buddy system initialize
    call slub_init

	call setup_vm_second  // build up second page table and point satp to it

    call task_init

    // sstatus.SIE = 0
    // don't take interrupt in supervisor mode
    csrci sstatus, 1 << 1  

    // sstatus.SIE = 1
    // take interrupt in supervisor mode
    # csrsi sstatus, 1 << 1

    // set first timer interrupt
    addi a7, zero, 0
    addi a6, zero, 0
    li a0, 10000000
    ecall

    addi t0, zero, 1 << 5
    csrs sie, t0

    j start_kernel  # jump to start_kernel
    
	.section .text.init
    .globl relocate
relocate:
    li t0, PA2VA_OFFSET
    add ra, ra, t0
    add sp, sp, t0

	// set satp
	// mode = 8, asid = 0, ppn = (&first_page_table) >> 12
	la t2, first_page_table
	srli t2, t2, 12  // we assume t2[63:32] = 0
	li t1, (1 << 63)
	or t1, t1, t2
	csrw satp, t1

relocate_after_set_satp:
	// flush TLB
	sfence.vma zero, zero
	ret


    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 0x1000 # <-- change to your stack size

    .globl boot_stack_top
boot_stack_top:
