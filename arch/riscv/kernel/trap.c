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

#define SUPERVISOR_TIMER_INTERRUPT 5
#define INSTRUCTION_PAGE_FAULT 12
#define ECALL_FROM_U_MODE 8
#define LOAD_PAGE_FAULT 13
#define STORE_PAGE_FAULT 15

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
    struct vm_area_struct *p = find_vma(current->mm, addr);
    if (p == NULL) {
        panic("page fault, access not in vmas");
    }
    uint64 c = exception_code_to_vm_flags(exception_code);
    if ((c & p->vm_flags) != c) {
        panic("page fault, illegal access mode");
    }
    // ok, map range
    uint64 pstart = 0;
    if (0 <= addr && addr < (uint64)uapp_end - (uint64)uapp_start) {
        pstart = va_to_pa((uint64)uapp_start); 
    } else {
        pstart = current->thread_info->user_stack_pa;
        if (!pstart) pstart = va_to_pa((uint64)kcalloc(PGSIZE));
    }
    map_range((uint64*)pa_to_va(current->page_table), p->vm_start, p->vm_end, pstart, vm_flags_to_pte_flags(p->vm_flags) | PTE_U);
}

void print_trap(uint64 isi, uint64 exc) {
    const char *s = "unknown";
    if (isi && exc == SUPERVISOR_TIMER_INTERRUPT) s = "timer interrupt";
    if (!isi && exc == INSTRUCTION_PAGE_FAULT) s = "instruction page fault";
    if (!isi && exc == LOAD_PAGE_FAULT) s = "load page fault";
    if (!isi && exc == STORE_PAGE_FAULT) s = "store page fault";
    if (!isi && exc == ECALL_FROM_U_MODE) s = "ecall from U-mode";
    printk("trap: %s\n", s);
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
