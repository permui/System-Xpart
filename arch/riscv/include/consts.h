#ifndef _CONSTS_H
#define _CONSTS_H

#define PHY_START 0x0000000080000000
#define PHY_SIZE 128 * 1024 * 1024
#define PHY_END (PHY_START + PHY_SIZE)

#define OPENSBI_SIZE (0x200000)

// this is the direct mapping part of VM
#define VM_START (0xffffffe000000000)
#define VM_END   (0xffffffff00000000)
#define VM_SIZE (VM_END - VM_START)
#define VM_MAP_END (VM_START + PHY_SIZE)

#define PA2VA_OFFSET (VM_START - PHY_START)

#define PGSIZE 0x1000
#define PGROUNDDOWN(addr) ((addr) & (~(PGSIZE - 1)))
#define PGROUNDUP(addr) PGROUNDDOWN((addr) + PGSIZE - 1)

// user space virtual address
// [USER_END - USER_STACK_LIMIT, USER_END) is used as user stack.
// These memory are allocated on demand.
#define USER_START (0x0000000000000000)
#define USER_END (0x0000004000000000)

#define USER_STACK_LIMIT (0x0000001000000000)

// sstatus register bits
#define SSTATUS_SPIE (1ul << 5)
#define SSTATUS_SUM (1ul << 18)
#define SSTATUS_SPP (1ul << 8)

// PTE configuration bits
#define PTE_U ((uint64)1 << 4)
#define PTE_X ((uint64)1 << 3)
#define PTE_W ((uint64)1 << 2)
#define PTE_R ((uint64)1 << 1)
#define PTE_V ((uint64)1 << 0)

// Virtual Memory

#define VM_READ     0x00000001
#define VM_WRITE    0x00000002
#define VM_EXEC     0x00000004

// kernel stack
#define KERNEL_STACK_SIZE (PGSIZE << 2)

// initrd
#define INITRD_START (VM_START + OPENSBI_SIZE + 0x4000000)

// user program len
#define USER_PROGRAM_LEN 3332

// free frame
#define FREE_FRAME_YES 1
#define FREE_FRAME_NO 0

// if printk info
#ifndef PRINTK_INFO
#define PRINTK_INFO 1
#endif

#endif
