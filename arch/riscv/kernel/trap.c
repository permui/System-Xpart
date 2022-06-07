// trap.c

#include "printk.h"
#include "clock.h"
#include "proc.h"
#include "consts.h"
#include "trap.h"
#include "../include/syscall.h"
#include "vm.h"
#include "panic.h"
#include "slub.h"
#include "utils.h"

#define SUPERVISOR_TIMER_INTERRUPT 5
#define INSTRUCTION_PAGE_FAULT 12
#define ECALL_FROM_U_MODE 8
#define LOAD_PAGE_FAULT 13
#define STORE_PAGE_FAULT 15
#define ILLEGAL_INSTRUCTION 2

typedef unsigned long uint64;

extern struct task_struct *current;
extern char uapp_start[], uapp_end[];

// static int first_page_fault = 0;

uint64 exception_code_to_vm_flags(uint64 exception_code) {
    switch (exception_code) {
        case INSTRUCTION_PAGE_FAULT:
            return VM_EXEC;
        case LOAD_PAGE_FAULT:
            return VM_READ;
        case STORE_PAGE_FAULT:
            return VM_WRITE;
        default:
            return 0;
    }
}

void handle_page_fault(uint64 exception_code, struct pt_regs *regs) {
    uint64 addr = regs->stval;

    // special handling for user stack
    if (USER_END - USER_STACK_LIMIT <= addr && addr < USER_END) {
        struct vm_area_struct *p = current->mm->mmap;
        for (; p && p->vm_end != USER_END; p = p->vm_next);
        myassert(p != NULL);
        myassert(p->vm_end == USER_END);
        myassert(addr < p->vm_start);

        uint64 c = exception_code_to_vm_flags(exception_code);
        if ((c & p->vm_flags) != c) {
            panic("page fault, illegal access mode for stack");
        }

        uint64 the_start = PGROUNDDOWN(addr);
        uint64 the_end = p->vm_start;
        uint64 the_size = the_end - the_start;
        uint64 pstart = va_to_pa((uint64)kmalloc(the_size));
        map_range((uint64*)pa_to_va(current->page_table), the_start, the_end, pstart, vm_flags_to_pte_flags(p->vm_flags) | PTE_U);
        p->vm_start = the_start;
    } else {
        struct vm_area_struct *p = find_vma(current->mm, addr);
        if (p == NULL) {
            panic("page fault, access not in vmas");
        }
        uint64 c = exception_code_to_vm_flags(exception_code);
        if ((c & p->vm_flags) != c) {
            panic("page fault, illegal access mode");
        }
        panic("this should not happen");
    }
}

void print_trap(uint64 isi, uint64 exc) {
    const char *s = "unknown\n";
    if (isi && exc == SUPERVISOR_TIMER_INTERRUPT) s = "timer interrupt\n";
    if (!isi && exc == INSTRUCTION_PAGE_FAULT) s = "instruction page fault\n";
    if (!isi && exc == LOAD_PAGE_FAULT) s = "load page fault\n";
    if (!isi && exc == STORE_PAGE_FAULT) s = "store page fault\n";
    if (!isi && exc == ECALL_FROM_U_MODE) s = "";
    if (!isi && exc == ILLEGAL_INSTRUCTION) s = "illegal instruction\n";
    printk("trap: %s", s);
}

void trap_handler(uint64 scause, struct pt_regs *regs) {
    uint64 is_interrupt = scause >> 63 & 1;
    uint64 exception_code = scause & 31;
    print_trap(is_interrupt, exception_code);
    // if (!is_interrupt && exception_code == INSTRUCTION_PAGE_FAULT && !first_page_fault) {
    //     // first page fault for relocation
    //     // this will be executed only once
    //     printk("first Instruction Page Fault at PC = %016lx\n", regs->sepc);
    //     regs->sepc += PA2VA_OFFSET;
    //     first_page_fault = 1;
    //     return;
    // }

    // normal trap handlers

    if (is_interrupt && exception_code == SUPERVISOR_TIMER_INTERRUPT) {
        clock_set_next_event();
        do_timer();
    }
    if (!is_interrupt && (exception_code == INSTRUCTION_PAGE_FAULT || exception_code == LOAD_PAGE_FAULT || exception_code == STORE_PAGE_FAULT)) {
        handle_page_fault(exception_code, regs);
    }
    if (!is_interrupt && exception_code == ECALL_FROM_U_MODE) {
        syscall(regs);
        regs->sepc += 4;
    }
}
