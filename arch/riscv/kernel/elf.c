#include "elf.h"
#include "consts.h"

uint64 elf_segment_flags_to_vm_flags(uint32 seg_flags) {
    uint64 ret = 0;
    if (seg_flags & ELF_PROG_FLAG_EXEC) ret |= VM_EXEC;
    if (seg_flags & ELF_PROG_FLAG_READ) ret |= VM_READ;
    if (seg_flags & ELF_PROG_FLAG_WRITE) ret |= VM_WRITE;
    return ret;
}