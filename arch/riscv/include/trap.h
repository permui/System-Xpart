#ifndef _TRAP_H_
#define _TRAP_H_

#include "types.h"

struct pt_regs {
    uint64 x[32];
    uint64 sepc;
    uint64 sscratch;
    uint64 stval;
};

#endif