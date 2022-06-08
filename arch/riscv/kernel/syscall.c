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
extern void _ret_by_trapframe(struct pt_regs *);
extern void _ret_from_execve();

void syscall(struct pt_regs *regs) {
    uint64 syscall_num = regs->x[17]; // a7
    switch (syscall_num) {
        case SYS_WRITE:
            printk_info("syscall: write\n");
            sys_write(regs);
            break;
        case SYS_GETPID:
            printk_info("syscall: getpid\n");
            sys_getpid(regs);
            break;
        case SYS_CLONE:
            printk_info("syscall: clone\n");
            sys_clone(regs);
            break;
        case SYS_READ:
            printk_info("syscall: read\n");
            sys_read(regs);
            break;
        case SYS_EXECVE:
            printk_info("syscall: execve\n");
            sys_execve(regs);
            break;
        case SYS_WAIT:
            printk_info("syscall: wait\n");
            sys_wait(regs);
            break;
        case SYS_EXIT:
            printk_info("syscall: exit\n");
            sys_exit(regs);
            break;
        default:
            printk_info("syscall: unknown\n");
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
    _ret_by_trapframe(current->trapframe);
}

void sys_clone(struct pt_regs *regs)  {
    struct task_struct *child = create_task();

    child->parent = current;

    // child's page table
    child->page_table = va_to_pa((uint64)create_user_page_table());

    // child's memory
    {
        // copy parent's memory to child, map them in child's page table
        struct vm_area_struct *p = current->mm->mmap;
        for (; p; p = p->vm_next) {
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
    const char *path = (const char*)regs->x[10];

    // we must save the path, because it's in user memory, which
    // will be unmaped when clearing current's memory
    uint64 len = strlen(path) + 1;
    char *buf = (char*)kmalloc(len);
    memcpy(buf, path, len);
    
    // we assume the path points to a legal elf file
     
    // current -> state, counter, priority, tid : no change
    // current -> thread : does not matter. we don't use _switch_to to go back
    // current -> parent : no change

    // clear current's memory
    uint64 *root_ptb = (uint64*)pa_to_va(current->page_table);
    {
        struct vm_area_struct *p = current->mm->mmap;
        while (p) {
            struct vm_area_struct *q = p->vm_next;
            unmap_range(root_ptb, p->vm_start, p->vm_end, FREE_FRAME_YES);
            kfree(p);
            p = q;
        }
        current->mm->mmap = NULL;
    }

    clear_tlb();

    uint64 entry_va = init_with_elf(current, buf);

    kfree(buf);

    do_mmap(current->mm, USER_END, 0, VM_READ | VM_WRITE);

    for (int i = 0; i < 32; ++i) current->trapframe->x[i] = 0;
    current->trapframe->sepc = entry_va;
    current->trapframe->sscratch = USER_END;
    current->trapframe->stval = 0; // doesn't matter

    _ret_by_trapframe(current->trapframe);
}

void sys_wait(struct pt_regs *regs) {
    current->state = TASK_PENDING;
    schedule();
}

void sys_exit(struct pt_regs *regs) {
    myassert(current->parent != NULL);
    while (1) {
        if (current->parent->state == TASK_PENDING) break;
        schedule();
    }
    current->parent->state = TASK_RUNNING;
    current->state = TASK_TERMINATED;
    schedule();
}