#include "stdio.h"

#define LEN 10
int f[LEN];

int main() {
    int T = 10;
    for (int i = 0; i < T; ++i) {
        printf("owen ");
    }
    printf("\n");

    f[0] = f[1] = 1;
    for (int i = 2; i < LEN; ++i) {
        f[i] = f[i - 1] + f[i - 2];
    }

    for (int i = 0; i < LEN; ++i) printf("%d ", f[i]);
    printf("\n");

    exit(0);
}