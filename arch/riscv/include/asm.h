#ifndef _ASM_H_
#define _ASM_H_

#include "consts.h"

#if __xlen == 64
#define __REG_SEL(a, b) a
#elif __xlen == 32
#define __REG_SEL(a, b) b
#else
#error "Unexpected __xlen"
#endif

#define REG_L __REG_SEL(ld, lw)
#define REG_S __REG_SEL(sd, sw)

#define TASK_STRUCT_THREAD_OFFSET 40
#define TASK_STRUCT_THREAD_TO_PAGE_TABLE 136

#endif
