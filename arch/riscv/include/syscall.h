#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#define SYS_OPENAT      56
#define SYS_CLOSE       57
#define SYS_READ        63  // working
#define SYS_WRITE       64  // OK
#define SYS_EXIT        93
#define SYS_GETPID      172 // OK
#define SYS_MUNMAP      215
#define SYS_CLONE       220 // OK
#define SYS_EXECVE      221
#define SYS_MMAP        222
#define SYS_MPROTECT    226
#define SYS_WAIT        260 

#include "trap.h"
#include "proc.h"

void syscall(struct pt_regs *regs);

void sys_write(struct pt_regs *regs);
void sys_getpid(struct pt_regs *regs);
void sys_clone(struct pt_regs *regs);
void sys_read(struct pt_regs *regs);
void sys_execve(struct pt_regs *regs);

#endif