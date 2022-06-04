#include "../include/syscall.h"
#include "trap.h"
#include "proc.h"
#include "printk.h"
#include "mm.h"
#include "string.h"

extern struct task_struct *current;
extern void child_ret_from_clone();
extern void _child_ret_from_clone(struct pt_regs *);

void syscall(struct pt_regs *regs) {
    uint64 syscall_num = regs->x[17]; // a7
    switch (syscall_num) {
        case SYS_WRITE:
            sys_write(regs);
            break;
        case SYS_GETPID:
            sys_getpid(regs);
            break;
        case SYS_CLONE:
            sys_clone(regs);
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

    // child's user stack
    {
        char *p = (char*)kalloc();
        memcpy(p, (const void *)(USER_END - PGSIZE), PGSIZE);
        child->thread_info->user_stack_pa = va_to_pa((uint64)p);
    }

    // child -> thread
    child->thread.ra = (uint64)child_ret_from_clone;
    child->thread.sp = (uint64)child + PGSIZE;
    // we don't bother s0 ~ s12, sepc, sscratch
    // because they doesn't matter
    child->thread.sstatus = current->thread.sstatus;

    // child's page table
    child->page_table = va_to_pa((uint64)create_user_page_table());

    // child's mm
    {
        struct vm_area_struct *p = current->mm->mmap;
        if (p == NULL) child->mm->mmap = NULL; else {
            struct vm_area_struct *q = (struct vm_area_struct *)kalloc();
            child->mm->mmap = q;
            q->vm_mm = child->mm;
            q->vm_start = p->vm_start;
            q->vm_end = p->vm_end;
            q->vm_prev = q->vm_next = NULL;
            q->vm_flags = p->vm_flags;
            for (p = p->vm_next; p; p = p->vm_next) {
                struct vm_area_struct *r = (struct vm_area_struct *)kalloc();
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

    // child's trapframe
    *(child->trapframe) = *regs;
    child->trapframe->x[10] = 0;
    child->trapframe->sepc = regs->sepc + 4;

    regs->x[10] = child->tid;
}