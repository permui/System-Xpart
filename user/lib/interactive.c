#include "interactive.h"
#include "../include/syscall.h"
#include "../include/string.h"

char getc() {
    char c;
    read(0, &c, 1);
    return c;
}

// the string returned is ended by '\0'. There is no '\r' or '\n' included.
// len is the max total len of the string, including '\0'.
void interactive_readline(char *buf, size_t len) {
    if (len == 0) return; // actually, invalid
    if (len == 1) { buf[0] = '\0'; return; }

    static char buffer[BUF_LEN];
    size_t i = 0;
    while (1) {
        char c = getc();
        if (c == BACKSPACE) {
            if (i > 0) {
                write(1, "\b \b", 3);
                --i;
            }
        } else if (c == '\r' || c == '\n') {
            write(1, "\n", 1);
            break;
        } else {
            if (i == BUF_LEN) break; else {
                write(1, &c, 1);
                buffer[i] = c;
                ++i;
            }
        }
    }
    size_t s = i < len - 1 ? i : (len - 1);
    memcpy(buf, buffer, s);
}