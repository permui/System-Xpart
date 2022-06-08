#ifndef _INTERACTIVE_H_
#define _INTERACTIVE_H_

#include "stddef.h"

#define BUF_LEN (1 << 10)

#define BACKSPACE 0x7f

void interactive_readline(char *buf, size_t len);

#endif