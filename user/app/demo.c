#include "syscall.h"
#include "stdio.h"

register void* current_sp __asm__("sp");

int main() {
  while (1) {
    printf("[User] pid: %ld, sp is %lx\n", getpid(), current_sp);
    for (unsigned int i = 0; i < 0xFFFFFFFF; i++);
  }
  
  return 0;
}
