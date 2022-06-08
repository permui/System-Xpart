// arch/riscv/include/proc.h

#ifndef _PROC_H_
#define _PROC_H_

#include "types.h"
#include "consts.h"
#include "vm.h"
#include "trap.h"
#include "list.h"

#define NR_TASKS (1 + 10)

// task state
#define TASK_RUNNING 0
#define TASK_PENDING 1
#define TASK_TERMINATED 2

// task priority
#define PRIORITY_MIN 1
#define PRIORITY_MAX 10

struct thread_info {
    // uint64 kernel_sp;
    uint64 user_stack_pa;
};

struct thread_struct {
    uint64 ra;
    uint64 sp;
    uint64 s[12];

    uint64 sepc, sstatus, sscratch;
};


struct task_struct {
    struct thread_info *thread_info;
    uint64 state;
    uint64 counter;
    uint64 priority;
    uint64 tid;

    struct thread_struct thread;

    // the physical address
    // of the page table
    uint64 page_table;

    struct mm_struct *mm;

    struct pt_regs *trapframe;

    // that is, the initial kernel sp
    uint64 kernel_stack_top;

    struct list_head task_node;

    struct task_struct *parent;
};

uint64* create_user_page_table();

uint64 init_with_elf(struct task_struct *t, const char *path);

struct task_struct *create_task();

void task_init();

void do_timer();

void schedule();

void switch_to(struct task_struct *next);

void dummy();


#endif