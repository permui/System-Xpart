#include "mm.h"
#include "proc.h"
#include "rand.h"
#include "defs.h"
#include "printk.h"
#include "vm.h"
#include "string.h"

extern void __dummy();
extern void __switch_to(struct task_struct *prev, struct task_struct *next);

struct task_struct *idle;
struct task_struct *current;
struct task_struct *task[NR_TASKS];
uint64 tot_task = 0;

extern char uapp_start[], uapp_end[];
extern uint64 second_page_table[512];

uint64* create_user_page_table() {
    uint64 *root_table = (uint64*)kalloc();

    // copy kernel mappings to user page table
    // since the U-bit is not set in kernel mappings,
    // user process cannot access them.
    memcpy(root_table, second_page_table, sizeof(second_page_table));

    return root_table;
}

// it has set t.(state, counter, priority, tid) and put it into task[]
// also alloc memory for t.(thread_info, mm, trapframe)
struct task_struct *create_task() {
    uint64 tid = ++tot_task;
    struct task_struct *t = (struct task_struct*)kalloc();

    t->state = TASK_RUNNING;
    t->counter = 0;
    t->priority = rand_range(1, 10);
    t->tid = tid;

    t->thread_info = (struct thread_info *)kalloc();
    t->thread_info->user_stack_pa = 0;
    t->mm = (struct mm_struct *)kalloc();
    t->trapframe = (struct pt_regs *)kalloc();

    task[t->tid] = t;

    return t;
}

void create_first_task() {
    struct task_struct *t = create_task();

    t->thread.ra = (uint64)__dummy;
    t->thread.sp = (uint64)t + PGSIZE;

    t->thread.sepc = USER_START;
    t->thread.sstatus = SSTATUS_SPIE | SSTATUS_SUM;
    t->thread.sscratch = USER_END;

    t->page_table = va_to_pa((uint64)create_user_page_table());

    uint64 _uapp_start = (uint64)uapp_start;
    uint64 _uapp_end = (uint64)uapp_end;
    uint64 _uapp_len = _uapp_end - _uapp_start;

    do_mmap(t->mm, USER_START, _uapp_end - _uapp_start, VM_READ | VM_WRITE | VM_EXEC);
    do_mmap(t->mm, USER_END - PGSIZE, PGSIZE, VM_READ | VM_WRITE);

    task[t->tid] = t;
}

void task_init() {
    idle = (struct task_struct*)kalloc();
    idle->state = TASK_RUNNING;
    idle->counter = 0;
    idle->priority = 0;
    idle->tid = 0;
    current = task[0] = idle;

    for (int i = 1; i < NR_TASKS; ++i) task[i] = NULL;

    create_first_task();

    printk("...proc_init done!\n");
}

// the user application
// will be run in user mode, use user stack
void dummy() {
    uint64 MOD = 1e9 + 7;
    uint64 incer = 0;
    uint64 lst_counter = -1;
    while (1) {
        if (lst_counter == -1 || lst_counter != current->counter) {
            lst_counter = current->counter;
            incer = (incer + 1) % MOD;
            printk("[TID = %lu] running, incer = %lu\n", current->tid, incer);
        }
    }
}

void switch_to(struct task_struct *next) {
    if (current != next) {
        struct task_struct *prev = current;
        current = next;
        printk("switch to [TID = %lu, Priority = %lu, Counter = %lu]\n", next->tid, next->priority, next->counter);
        __switch_to(prev, next);
    }
}

void do_timer() {
    if (current == idle || --current->counter == 0) {
        schedule();
    }
}

// We assume the only state is TASK_RUNNING.
// I think not checking it is better than
// checking it, even the effects are the same.
uint64 schedule_sjf() {
    uint64 counter_mi = 0, id = 0;
    for (int i = 1; i < NR_TASKS; ++i) if (task[i]) {
        if (task[i]->counter != 0) {
            if (counter_mi == 0 || task[i]->counter < counter_mi) {
                counter_mi = task[i]->counter;
                id = i;
            }
        }
    }
    if (counter_mi != 0) return id;

    // if equal to zero, then all counters of task[1..NR_TASKS-1]
    // are zero. Repopulate.
    for (int i = 1; i < NR_TASKS; ++i) if (task[i]) {
        task[i]->counter = rand_range(2, 4);
        printk("SET [TID = %d, Priority = %lu, Counter <- %lu]\n", i, task[i]->priority, task[i]->counter);
    }
    return schedule_sjf();
}

uint64 schedule_priority() {
    uint64 counter_mx = 0, id = 0;
    for (int i = 1; i < NR_TASKS; ++i) if (task[i]) {
        if (task[i]->counter > counter_mx) {
            counter_mx = task[i]->counter;
            id = i;
        }
    }
    if (counter_mx != 0) return id;

    // if equal to zero, then all counters of task[1..NR_TASKS-1]
    // are zero. Repopulate **according to priority**.
    // Higher priority number, higher priority.
    for (int i = 1; i < NR_TASKS; ++i) if (task[i]) {
        task[i]->counter = task[i]->priority;
        printk("SET [TID = %d, Priority = %lu, Counter <- %lu]\n", i, task[i]->priority, task[i]->counter);
    }
    return schedule_priority();
}

#ifdef SJF
#define schedule_algo schedule_sjf
#else
#ifdef PRIORITY
#define schedule_algo schedule_priority
#else
// #error "scheduling algorithm not given"
#endif
#endif

void schedule() {
    uint64 nxt_id = schedule_algo();
    switch_to(task[nxt_id]);
}