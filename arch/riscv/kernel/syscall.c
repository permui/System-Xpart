#include "../include/syscall.h"
#include "trap.h"
#include "proc.h"
#include "printk.h"
#include "string.h"
#include "slub.h"
#include "baseio.h"
#include "utils.h"
#include "panic.h"

extern struct task_struct *current;
extern void child_ret_from_clone();
extern void _child_ret_from_clone(struct pt_regs *);
extern void _ret_from_execve();

void syscall(struct pt_regs *regs) {
    uint64 syscall_num = regs->x[17]; // a7
    switch (syscall_num) {
        case SYS_WRITE:
            printk("syscall: write\n");
            sys_write(regs);
            break;
        case SYS_GETPID:
            printk("syscall: getpid\n");
            sys_getpid(regs);
            break;
        case SYS_CLONE:
            printk("syscall: clone\n");
            sys_clone(regs);
            break;
        case SYS_READ:
            printk("syscall: read\n");
            sys_read(regs);
            break;
        case SYS_EXECVE:
            printk("syscall: execve\n");
            sys_execve(regs);
            break;
    }
}

void sys_getpid(struct pt_regs *regs) {
    regs->x[10] = current->tid;
}

void sys_write(struct pt_regs *regs) {
    uint64 fd = regs->x[10]; // a0
    const char *c = (const char *)regs->x[11]; // a1
    uint64 cnt = regs->x[12]; // a2
    for (uint64 i = cnt; i--; ++c) putc(*c);
    regs->x[10] = cnt; // return_value = cnt
}

void child_ret_from_clone() {
    _child_ret_from_clone(current->trapframe);
}

void sys_clone(struct pt_regs *regs)  {
    struct task_struct *child = create_task();

    uint64 parent_user_sp = regs->sscratch;

    // child's page table
    child->page_table = va_to_pa((uint64)create_user_page_table());

    // child's user stack
    {
        // parent's current stack is copied and mapped in child's address space
        uint64 parent_stack_low = PGROUNDDOWN(parent_user_sp);
        uint64 parent_stack_size = USER_END - parent_stack_low;
        uint64 parent_stack_flags = find_vma(current->mm, parent_user_sp)->vm_flags;
        // this is not necessary: we don't need the physical pages to be continuous
        // we can alloc and copy page by page
        char *p = (char*)kcalloc(parent_stack_size); 
        memcpy(p, (const void *)parent_stack_low, parent_stack_size);
        map_range((uint64*)pa_to_va(child->page_table), parent_stack_low, USER_END, va_to_pa((uint64)p), vm_flags_to_pte_flags(parent_stack_flags) | PTE_U);
    }

    // child's other memory
    {
        // copy parent's other memory, namely those recorded by vm_area_structs, excluding the stack, to child
        // and map them
        struct vm_area_struct *p = current->mm->mmap;
        for (; p; p = p->vm_next) if (p->vm_end != USER_END) {
            // not the stack
            uint64 start = p->vm_start;
            uint64 end = p->vm_end;
            uint64 size = end - start;
            char *q = (char*)kcalloc(size);
            memcpy(q, (const void *)start, size);
            map_range((uint64*)pa_to_va(child->page_table), start, end, va_to_pa((uint64)q), vm_flags_to_pte_flags(p->vm_flags) | PTE_U);
        }
    }

    // child's mm
    {
        // copy parent's mm 
        struct vm_area_struct *p = current->mm->mmap;
        if (p == NULL) child->mm->mmap = NULL; else {
            struct vm_area_struct *q = (struct vm_area_struct *)kcalloc(sizeof(struct vm_area_struct));
            child->mm->mmap = q;
            q->vm_mm = child->mm;
            q->vm_start = p->vm_start;
            q->vm_end = p->vm_end;
            q->vm_prev = q->vm_next = NULL;
            q->vm_flags = p->vm_flags;
            for (p = p->vm_next; p; p = p->vm_next) {
                struct vm_area_struct *r = (struct vm_area_struct *)kcalloc(sizeof(struct vm_area_struct));
                r->vm_mm = child->mm;
                r->vm_start = p->vm_start;
                r->vm_end = p->vm_end;
                r->vm_next = NULL;
                r->vm_prev = q;
                r->vm_flags = p->vm_flags;
                q->vm_next = r;
                q = r;
            }
        }
    }

    // child -> thread
    child->thread.ra = (uint64)child_ret_from_clone;
    child->thread.sp = (uint64)kcalloc(KERNEL_STACK_SIZE) + KERNEL_STACK_SIZE;
    // we don't bother s0 ~ s12, sepc, sscratch
    // because they doesn't matter
    child->thread.sstatus = current->thread.sstatus;

    // child's trapframe
    *(child->trapframe) = *regs;
    child->trapframe->x[10] = 0;
    child->trapframe->sepc = regs->sepc + 4;

    regs->x[10] = child->tid;
}

void sys_read(struct pt_regs *regs) {
    uint64 fd = regs->x[10];
    char *c = (char*)regs->x[11];
    uint64 cnt = regs->x[12];
    myassert(fd == 0); // only "stdin" is supported now
    for (uint64 i = cnt; i--; ++c) *c = (char)getc();
    regs->x[10] = cnt;
}

void sys_execve(struct pt_regs *regs) {
    char *path = regs->x[10];
    
    // we assume the path points to a legal elf file
     
    // current -> state, counter, priority, tid : no change
    // current -> thread : does not matter. we don't use _switch_to to go back

    panic("working");
}