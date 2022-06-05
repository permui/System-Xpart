#pragma once

#define SYS_OPENAT      56
#define SYS_CLOSE       57
#define SYS_READ        63
#define SYS_WRITE       64
#define SYS_EXIT        93
#define SYS_GETPID      172
#define SYS_MUNMAP      215
#define SYS_FORK        220 // clone
#define SYS_EXECVE      221
#define SYS_MMAP        222
#define SYS_MPROTECT    226
#define SYS_WAIT        260 // wait4

long getpid();
int fork(void);
int exit(int stat);
int wait();
int exec(char* path);
int open(const char* name, int pri);
int read(int fd, void* buf, int nbuf);
int write(int fd, const void* buf, int nbuf);
int close(int fd);
