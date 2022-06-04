#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#define SYS_WRITE   64
#define SYS_GETPID  172
#define SYS_CLONE 220

#include "trap.h"
#include "proc.h"

void syscall(struct pt_regs *regs);

void sys_write(struct pt_regs *regs);
void sys_getpid(struct pt_regs *regs);
void sys_clone(struct pt_regs *regs);

#endif