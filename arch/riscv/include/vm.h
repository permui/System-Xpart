#ifndef _VM_H_
#define _VM_H_

#include "types.h"

// we guarantee that vm_start and vm_end are aligned to page boundaries
struct vm_area_struct {
    struct mm_struct *vm_mm;
    uint64 vm_start;
    uint64 vm_end;

    struct vm_area_struct *vm_next, *vm_prev;

    uint64 vm_flags;
};

struct mm_struct {
    struct vm_area_struct *mmap;
};


/*
* @mm          : current thread's mm_struct
* @address     : the va to look up
*
* @return      : the VMA if found or NULL if not found
*/
struct vm_area_struct *find_vma(struct mm_struct *mm, uint64 addr);

/*
 * @mm     : current thread's mm_struct
 * @addr   : the suggested va to map
 * @length : memory size to map
 * @prot   : protection
 *
 * @return : start va
*/
uint64 do_mmap(struct mm_struct *mm, uint64 addr, uint64 length, int prot);

uint64 get_unmapped_area(struct mm_struct *mm, uint64 length);

uint64 va_to_pa(uint64 va);
uint64 pa_to_va(uint64 pa); 
uint64 vm_flags_to_pte_flags(uint64 vm_flags);

void map_range(uint64 *root_table, uint64 vstart, uint64 vend, uint64 pstart, uint64 flags);

void unmap_range(uint64 *root_table, uint64 vstart, uint64 vend, uint64 free_frame);

void setup_vm_first();

void setup_vm_second();


#endif