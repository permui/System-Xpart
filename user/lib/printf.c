#include "stdio.h"
#include "../include/syscall.h"

int tail = 0;
char buffer[1000] = {[0 ... 999] = 0};

static inline int putchar(int c) {
    buffer[tail++] = (char)c;
    return 0;
}

static int vprintfmt(int fd, int(*putch)(int), const char *fmt, va_list vl) {
    int in_format = 0, longarg = 0;
    size_t pos = 0;

    for( ; *fmt; fmt++) {
        if (in_format) {
            switch(*fmt) {
                case 'l': { 
                    longarg = 1; break; 
                }
                
                case 'x': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);

                    int hexdigits = 2 * (longarg ? sizeof(long) : sizeof(int)) - 1;
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
                        int hex = (num >> (4*halfbyte)) & 0xF;
                        char hexchar = (hex < 10 ? '0' + hex : 'a' + hex - 10);
                        putch(hexchar);
                        pos++;
                    }
                    longarg = 0; in_format = 0; break;
                }
            
                case 'd': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
                    if (num < 0) {
                        num = -num; putch('-');
                        pos++;
                    }
                    int bits = 0;
                    char decchar[25] = {'0', 0};
                    for (long tmp = num; tmp; bits++) {
                        decchar[bits] = (tmp % 10) + '0';
                        tmp /= 10;
                    }
                    
                    if (bits == 0) bits ++;

                    for (int i = bits - 1; i >= 0; i--) {
                        putch(decchar[i]);
                    }
                    pos += bits + 1;
                    longarg = 0; in_format = 0; break;
                }

                case 'u': {
                    unsigned long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
                    int bits = 0;
                    char decchar[25] = {'0', 0};
                    for (long tmp = num; tmp; bits++) {
                        decchar[bits] = (tmp % 10) + '0';
                        tmp /= 10;
                    }

                    if (bits == 0) bits ++;

                    for (int i = bits - 1; i >= 0; i--) {
                        putch(decchar[i]);
                    }
                    pos += bits - 1;
                    longarg = 0; in_format = 0; break;
                }

                case 's': {
                    const char* str = va_arg(vl, const char*);
                    while (*str) {
                        putch(*str);
                        pos++; 
                        str++;
                    }
                    longarg = 0; in_format = 0; break;
                }

                case 'c': {
                    char ch = (char)va_arg(vl,int);
                    putch(ch);
                    pos++;
                    longarg = 0; in_format = 0; break;
                }
                default:
                    break;
            }
        }
        else if(*fmt == '%') {
          in_format = 1;
        }
        else {
            putch(*fmt);
            pos++;
        }
    }

    long syscall_ret;
    buffer[tail++] = '\0';

    syscall_ret = write(fd, &buffer, tail);

    return syscall_ret;
}


int printf(const char* s, ...) {
    int res = 0;
    va_list vl;
    va_start(vl, s);
    tail = 0;
    res = vprintfmt(1, putchar, s, vl);
    va_end(vl);
    return res;
}

int fprintf(int fd, const char* fmt, ...) 
{
	int res = 0;
	va_list vl;
	va_start(vl, fmt);
	tail = 0;
	res = vprintfmt(fd, putchar, fmt, vl);
	va_end(vl);
	return res;
}

void panic(char* s) {
	fprintf(2,"%s\n",s);
	exit(1);
}
