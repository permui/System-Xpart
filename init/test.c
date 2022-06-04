#include "printk.h"
#include "defs.h"

// Please do not modify
// Sorry, I modified.

int test() {
    while (1);

    int x = 0;
    int T = 1e9;
    for (int i = 1; i <= T; ++i) {
        for (int j = 1; j <= T; ++j) {
            int y = i + j;
            int z = i * j;
            y ^= z;
            x ^= y;
        }
    }
    return x;
}
