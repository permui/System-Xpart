#include "proc.h"
#include "rand.h"
#include "defs.h"
#include "printk.h"
#include "vm.h"
#include "string.h"
#include "slub.h"
#include "fs.h"
#include "elf.h"
#include "utils.h"

extern void __dummy();
extern void __switch_to(struct task_struct *prev, struct task_struct *next);
extern void __switch_to_no_store(struct task_struct *next);

struct task_struct *idle;
struct task_struct *current;
struct list_head tasks;
uint64 tot_task = 0;

extern char uapp_start[], uapp_end[];
extern uint64 second_page_table[512];

uint64* create_user_page_table() {
    uint64 *root_table = (uint64*)kcalloc(PGSIZE);

    // copy kernel mappings to user page table
    // since the U-bit is not set in kernel mappings,
    // user process cannot access them.
    memcpy(root_table, second_page_table, sizeof(second_page_table));

    return root_table;
}

void free_task(struct task_struct *t) {
    if (t == NULL) return;

    // free pages
    uint64 *root_pgt = (uint64*)pa_to_va(t->page_table);

    struct vm_area_struct *p = t->mm->mmap;
    while (p) {
        struct vm_area_struct *q = p->vm_next;
        unmap_range(root_pgt, p->vm_start, p->vm_end, FREE_FRAME_YES);
        kfree(p);
        p = q;
    }

    free_page_table(root_pgt);
    
    // now, only the kernel part, that is, second_page_table remains

    kfree(t->thread_info);
    kfree(t->mm);
    kfree(t->trapframe);

    list_del(&t->task_node);

    kfree(t);
}

// it has set t.(state, counter, priority, tid, kernel_stack_top) and add it into the linked list
// also alloc memory for t.(thread_info, mm, trapframe)
struct task_struct *create_task() {
    uint64 tid = ++tot_task;
    struct task_struct *t = (struct task_struct*)kcalloc(sizeof(struct task_struct));

    t->state = TASK_RUNNING;
    t->counter = 0;
    t->priority = rand_range(1, 10);
    t->tid = tid;

    t->thread_info = (struct thread_info *)kcalloc(sizeof(struct thread_info));
    t->thread_info->user_stack_pa = 0;
    t->mm = (struct mm_struct *)kcalloc(sizeof(struct mm_struct));
    t->trapframe = (struct pt_regs *)kcalloc(sizeof(struct pt_regs));

    t->kernel_stack_top = (uint64)kcalloc(KERNEL_STACK_SIZE) + KERNEL_STACK_SIZE;

    list_add_tail(&t->task_node, &tasks);

    return t;
}

// it initialize a task "t" with an elf file named by "path"
// it assumes "t->page_table" is already created.
// it load the elf into memory, map them, create vma entry
// it does not bother the user stack, only bother the user code
// it returns the entry point (virtual address)
uint64 init_with_elf(struct task_struct *t, const char *path) {
    struct inode *i = namei(path);
    struct elfhdr hdr;
    readi(i, 0, &hdr, 0, sizeof(hdr));

    uint64 *page_table_va = (uint64*)pa_to_va(t->page_table);
    
    // load "LOAD" segments: copy into memory, map_range in page_table
    uint proghdr_size = sizeof(struct proghdr);
    for (uint s = hdr.phoff, j = 0; j < hdr.phnum; ++j, s += proghdr_size) {
        struct proghdr p;
        readi(i, 0, &p, s, proghdr_size);
        if (p.type == ELF_PROG_LOAD) {
            myassert(p.align == PGSIZE);
            uint64 va_start = PGROUNDDOWN(p.vaddr);
            uint64 va_end = PGROUNDUP(p.vaddr + p.memsz); 
            uint64 mem_size = va_end - va_start;
            if (mem_size) {
                // this is aligned to page boundary.
                // guaranteed by implementation.
                void *q = kcalloc(mem_size); 
                readi(i, 0, q + (p.vaddr - va_start), p.off, p.filesz);
                uint64 vm_flags = elf_segment_flags_to_vm_flags(p.flags);
                uint64 pte_flags = vm_flags_to_pte_flags(vm_flags) | PTE_U;
                map_range(page_table_va, va_start, va_end, va_to_pa((uint64)q), pte_flags);
                do_mmap(t->mm, va_start, mem_size, vm_flags);
            }
        }
    }

    return hdr.entry;
}

void create_first_task() {
    struct task_struct *t = create_task();

    t->parent = NULL;

    t->thread.ra = (uint64)__dummy;
    t->thread.sp = t->kernel_stack_top;

    uint64 *page_table_va = create_user_page_table();
    t->page_table = va_to_pa((uint64)page_table_va);

    uint64 entry_va = init_with_elf(t, "shell");

    do_mmap(t->mm, USER_END, 0, VM_READ | VM_WRITE);

    t->thread.sepc = entry_va;
    t->thread.sstatus = SSTATUS_SPIE | SSTATUS_SUM;
    t->thread.sscratch = USER_END;
 
    // t->page_table = va_to_pa((uint64)create_user_page_table());

    // t->thread.sepc = USER_START;
    // t->thread.sstatus = SSTATUS_SPIE | SSTATUS_SUM;
    // t->thread.sscratch = USER_END;

    // do_mmap(t->mm, USER_START, USER_PROGRAM_LEN, VM_READ | VM_WRITE | VM_EXEC);
    // do_mmap(t->mm, USER_END - PGSIZE, PGSIZE, VM_READ | VM_WRITE);

}

void task_init() {

    INIT_LIST_HEAD(&tasks);

    idle = (struct task_struct*)kcalloc(sizeof(struct task_struct));
    idle->state = TASK_RUNNING;
    idle->counter = 0;
    idle->priority = 0;
    idle->tid = 0;
    current = idle;

    list_add_tail(&idle->task_node, &tasks);

    create_first_task();

    printk_info("...proc_init done!\n");
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
            printk_info("[TID = %lu] running, incer = %lu\n", current->tid, incer);
        }
    }
}

void switch_to(struct task_struct *next) {
    if (current != next) {
        struct task_struct *prev = current;
        current = next;
        printk_info("switch to [TID = %lu, Priority = %lu, Counter = %lu]\n", next->tid, next->priority, next->counter);
        __switch_to(prev, next);
    }
}

void switch_to_no_store(struct task_struct *next) {
    current = next;
    printk_info("switch to [TID = %lu, Priority = %lu, Counter = %lu]\n", next->tid, next->priority, next->counter);
    __switch_to_no_store(next);
}

void do_timer() {
    if (current == idle || --current->counter == 0) {
        schedule();
    }
}

// We assume the only state is TASK_RUNNING.
// I think not checking it is better than
// checking it, even the effects are the same.
struct task_struct *schedule_sjf() {
    uint64 counter_mi = 0;
    struct task_struct *ret = NULL;
    struct task_struct *t;
    list_for_each_entry(t, &tasks, task_node) if (t->tid != 0 && t->state == TASK_RUNNING) {
        if (t->counter != 0) {
            if (counter_mi == 0 || t->counter < counter_mi) {
                counter_mi = t->counter;
                ret = t;
            }
        }
    }
    if (counter_mi != 0) return ret;

    // if equal to zero, then all counters of non-idle tasks where task exists and running
    // are zero. Repopulate.
    list_for_each_entry(t, &tasks, task_node) if (t->tid != 0 && t->state == TASK_RUNNING) {
        t->counter = rand_range(2, 4);
        printk_info("SET [TID = %d, Priority = %lu, Counter <- %lu]\n", t->tid, t->priority, t->counter);
    }
    return schedule_sjf();
}

struct task_struct *schedule_priority() {
    uint64 counter_mx = 0, id = 0;
    struct task_struct *t, *ret = NULL;
    list_for_each_entry(t, &tasks, task_node) if (t->tid != 0 && t->state == TASK_RUNNING) {
        if (t->counter > counter_mx) {
            counter_mx = t->counter;
            ret = t;
        }
    }
    if (counter_mx != 0) return ret;

    // if equal to zero, then all counters of non-idle tasks
    // are zero. Repopulate **according to priority**.
    // Higher priority number, higher priority.
    list_for_each_entry(t, &tasks, task_node) if (t->tid != 0 && t->state == TASK_RUNNING) {
        t->counter = t->priority;
        printk_info("SET [TID = %d, Priority = %lu, Counter <- %lu]\n", t->tid, t->priority, t->counter);
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
    struct task_struct *next = schedule_algo();
    switch_to(next);
}

void schedule_no_store() {
    struct task_struct *next = schedule_algo();
    switch_to_no_store(next);
}