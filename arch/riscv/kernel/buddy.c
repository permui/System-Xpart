#include "buddy.h"
#include "consts.h"
#include "panic.h"
#include "utils.h"
#include "string.h"

extern char _ekernel[];

struct buddy bud;

void init_buddy_system(void) {
    // we are running in virtual memory
    // before this funciton is called, no kernel page allocation is required.

    uint64 size = PHY_SIZE / PGSIZE;
    uint64 len = size * 2 - 1;
    uint64 bud_b_start = PGROUNDUP((uint64)_ekernel);
    uint64 bud_b_end = PGROUNDUP(bud_b_start + sizeof(uint64) * len);

    bud.size = size;
    bud.b = (uint64*)bud_b_start;

    // initialize bud.b
    for (uint64 i = 0, j = 0, k = size; k; i += 1 << j, ++j, k >>= 1) {
        for (int r = 0; r < (1 << j); ++r) bud.b[i + r] = k;
    }

    // the beginning "used_pages" pages have been used
    // using alloc_pages to deal with this depends on the 
    // lefty nature of alloc_pages.
    uint64 used_pages = (bud_b_end - VM_START) / PGSIZE;
    alloc_pages(used_pages);
}

static void update_b(uint64 x, uint64 len) {
    // x must be an internal node
    uint64 b_lc = bud.b[x * 2 + 1];
    uint64 b_rc = bud.b[x * 2 + 2];
    uint64 sub_len = len >> 1;

    if (b_lc == sub_len && b_rc == sub_len) bud.b[x] = len; else bud.b[x] = max(b_lc, b_rc);
}

// returns the starting page's page id (in the buddy system)
// bud.b are updated 
static uint64 alloc_pages_aux(uint64 x, uint64 n, uint64 len) {
    uint64 ret = 0;
    uint64 alloc_this = 0;
    if (x < bud.size - 1) {
        // not the last level
        uint64 lc = x * 2 + 1;
        uint64 rc = x * 2 + 2;
        if (bud.b[lc] >= n) ret = alloc_pages_aux(lc, n, len >> 1); else
        if (bud.b[rc] >= n) ret = alloc_pages_aux(rc, n, len >> 1); else
        alloc_this = 1;
    } else alloc_this = 1;
    if (alloc_this) {
        bud.b[x] = 0;
        ret = len * (x + 1) - bud.size;
    } else {
        update_b(x, len);
    }
    return ret;
}

// pages allocated are not guaranteed to be clean (all-zero)
void* alloc_pages(uint64 n) {
    if (bud.b[0] < n) { 
        // cannot satisfy request
        panic("alloc_pages: continuous pages not long enought, cannot satisfy request.");
    }

    // request is guaranteed to be satisfied
    uint64 page_id = alloc_pages_aux(0, n, bud.size);
    uint64 r = page_id * PGSIZE + VM_START;

    return (void*)r;
}

// v is the start of those pages
void free_pages(void* v) {
    uint64 addr = (uint64)v;
    uint64 page_id = (addr - VM_START) / PGSIZE;
    uint64 bottom_x = bud.size - 1 + page_id;
    uint64 x = bottom_x, len = 1;
    while (x > 0 && bud.b[x] != 0) {
        x = (x - 1) >> 1;
        len <<= 1;
    }
    if (bud.b[x] != 0) {
        panic("free_pages: this is not an allocated node");
    }
    memset(v, 0, len * PGSIZE);
    bud.b[x] = len;
    while (x) {
        x = (x - 1) >> 1;
        len <<= 1;
        update_b(x, len);
    }
}
