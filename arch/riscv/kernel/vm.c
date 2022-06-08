#include <consts.h>
#include <types.h>
#include <string.h>
#include <printk.h>
#include <vm.h>
#include "slub.h"

/**
 * assume mm != NULL
 */
struct vm_area_struct *find_vma(struct mm_struct *mm, uint64 addr) {
    struct vm_area_struct *p = mm->mmap;
    while (p) {
        if (p->vm_start <= addr && addr < p->vm_end) break;
        p = p->vm_next;
    }
    return p;
}

int intersect(struct mm_struct *mm, uint64 l, uint64 r) {
    struct vm_area_struct *p = mm->mmap;
    for (; p; p = p->vm_next) {
        if (!(r <= p->vm_start || p->vm_end <= l)) return 1;
    }
    return 0;
}

void insert(struct mm_struct *mm, struct vm_area_struct *p) {
    if (mm->mmap == NULL) {
        mm->mmap = p;
        p->vm_prev = p->vm_next = NULL;
        return;
    }
    struct vm_area_struct *x = mm->mmap;
    while (x->vm_next) x = x->vm_next;
    x->vm_next = p;
    p->vm_prev = x;
    p->vm_next = NULL;
}

uint64 do_mmap(struct mm_struct *mm, uint64 addr, uint64 length, int prot) {
    printk_info("do_mmap(%lu, %lu)\n", addr, length);
    if (intersect(mm, addr, addr + length)) addr = get_unmapped_area(mm, length);
    struct vm_area_struct *p = (struct vm_area_struct *)kcalloc(sizeof(struct vm_area_struct));
    p->vm_start = addr;
    p->vm_end = addr + length;
    p->vm_flags = prot;
    p->vm_mm = mm;
    insert(mm, p);
}

uint64 get_unmapped_area(struct mm_struct *mm, uint64 length) {
    uint64 i = 0;
    for (; intersect(mm, i, i + length); i += PGSIZE);
    return i;
}

extern char _stext[], _etext[];
extern char _srodata[], _erodata[];
extern char _sdata[];

// YAY: I think these two arrays are accessed by PC-relative addressing
uint64 first_page_table[512] __attribute__((aligned (0x1000) ));
uint64 second_page_table[512] __attribute__((aligned (0x1000) ));

uint64 va_to_pa(uint64 va) {
	return va - PA2VA_OFFSET;
}

uint64 pa_to_va(uint64 pa) {
	return pa + PA2VA_OFFSET;
}

uint64 vm_flags_to_pte_flags(uint64 vm_flags) {
    uint64 ret = 0;
    if (vm_flags & VM_READ) ret |= PTE_R;
    if (vm_flags & VM_WRITE) ret |= PTE_W;
    if (vm_flags & VM_EXEC) ret |= PTE_X;
    return ret;
}

static uint64 pte_to_pa(uint64 pte) {
	return ((pte >> 10) & ((1l << 44) - 1)) << 12;
}

static uint64 pte_to_va(uint64 pte) {
	return pa_to_va(pte_to_pa(pte));
}

static uint64 compose_pte(uint64 pa, uint64 flags) {
	uint64 ppn = (pa & ((1l << 56) - 1)) >> 12;
	return (ppn << 10) | flags;
}

static void first_map(uint64 va, uint64 pa, uint64 flags) {
    uint64 pte = compose_pte(pa, flags | PTE_V);
	first_page_table[(va >> 30) & ((1l << 9) - 1)] = pte;
}

void setup_vm_first() {
	// memset(first_page_table, 0, PGSIZE);
	// uint64 pa = 0x80000000;
	// uint64 va2 = 0xffffffe000000000l;
	// first_map(va2, pa, PTE_X | PTE_W | PTE_R);

    // for simplicity, let's adopt the two-mapping scheme
    memset(first_page_table, 0, PGSIZE);
    uint64 pa = 0x80000000;
    uint64 va1 = 0x80000000l, va2 = 0xffffffe000000000l;
    first_map(va1, pa, PTE_X | PTE_W | PTE_R);
    first_map(va2, pa, PTE_X | PTE_W | PTE_R);
}

static uint64 get_or_create_internal_entry(uint64 *table, uint64 idx) {
	if (table[idx] & PTE_V) return table[idx];
	// get a new page
	uint64 va = (uint64)kcalloc(PGSIZE), pa = va_to_pa(va);
	uint64 pte = compose_pte(pa, PTE_V);
	table[idx] = pte;
	return pte;
}

/* 
    Set mapping of [vstart, vend) -> [pstart, pend), where pend - pstart = vend - vstart.
    For SV39 mode, three-level page table.
    @param root_table the root page table
    @param vstart must be aligned to page boundary
    @param vend can be not aligned to page boundary
    @param pstart must be aligned to page boundary
    @param flags PTE flags in the mapping. The "valid" bit will be set by the function,
                 so it is not required to be in the flags.
*/
void map_range(uint64 *root_table, uint64 vstart, uint64 vend, uint64 pstart, uint64 flags) {

 	for (; vstart < vend; vstart += PGSIZE, pstart += PGSIZE) {
		uint64 vpn[3], tmp = vstart >> 12;
		uint64 *table = root_table;
		for (int j = 0; j < 3; ++j, tmp >>= 9) vpn[j] = tmp & ((1l << 9) - 1);
		for (int j = 2; j > 0; --j) {
			uint64 pte = get_or_create_internal_entry(table, vpn[j]);
			table = (uint64*)pte_to_va(pte);
		}
		table[vpn[0]] = compose_pte(pstart, flags | PTE_V);
	}
	
}

/**
 * @param vstart must be aligned to page boundary
 * @param vend can be not aliged to page boundary
 * @param free_frame whether free the physical frame under this map (FREE_FRAME_YES, FREE_FRAME_NO)
 */
void unmap_range(uint64 *root_table, uint64 vstart, uint64 vend, uint64 free_frame) {
    for (; vstart < vend; vstart += PGSIZE) {
		uint64 vpn[3], tmp = vstart >> 12;
		uint64 *table = root_table;
		for (int j = 0; j < 3; ++j, tmp >>= 9) vpn[j] = tmp & ((1l << 9) - 1);
		for (int j = 2; j > 0 && table; --j) {
			uint64 pte = table[vpn[j]];
			table = pte & PTE_V ? (uint64*)pte_to_va(pte) : NULL;
		}
        if (table) {
            uint64 pte = table[vpn[0]];
            if (pte & PTE_V) {
                if (free_frame == FREE_FRAME_YES) {
                    void *q = (void*)pte_to_va(pte);
                    // here is a danger: if we allocate 2 pages,
                    // and call kfree on the beginning of the first page,
                    // our Buddy & SLUB system will free the 2 pages together.
                    // what if we call kfree on the beginning of the second page?
                    // maybe problem
                    kfree(q);
                }
                table[vpn[0]] = 0; // clear and invalid
            }
        }
	}
}

/**
   @param _vstart must be aligned to page boundary
   @param _vend can be not aligned to page boundary
   @param _pstart must be aligned to page boundary
*/
static void second_map_range(uint64 *root_table, char *_vstart, char *_vend, char *_pstart, uint64 flags) {
	uint64 vstart = ((uint64)_vstart);
	uint64 vend = ((uint64)_vend);
	uint64 pstart = ((uint64)_pstart);

    map_range(root_table, vstart, vend, pstart, flags);
}

void setup_vm_second() {
	memset(second_page_table, 0, PGSIZE);
	
	second_map_range(second_page_table, _stext, _etext, _stext - PA2VA_OFFSET, PTE_X | PTE_R);
	second_map_range(second_page_table, _srodata, _erodata, _srodata - PA2VA_OFFSET, PTE_R);
	second_map_range(second_page_table, _sdata, (char*)VM_MAP_END, _sdata - PA2VA_OFFSET, PTE_W | PTE_R);

    uint64 sec_table_pa = (uint64)(&second_page_table) - PA2VA_OFFSET;

	__asm__ (
        "mv t2, %0\n"
		"srli t2, t2, 12\n"
		"li t1, (1 << 63)\n"
		"or t1, t1, t2\n"
		"csrw satp, t1\n"
		"sfence.vma zero, zero"
	    :
        : "r" (sec_table_pa)
    );

}

void clear_tlb() {
    __asm__ (
        "sfence.vma zero, zero"
        : :
    );
}