#include <stdio.h>
#include <stdlib.h>

int main (int argc, char** argv) {
    int i;
    int a[3] = {3, 4, 5};
    int b = 4;
    int c = 6;
    int d = 8;

    // 4, 6, 8
    printf("Test0 %d, %d, %d.\n", b, c, d);

#pragma omp target map(to: b) map(from: c) map(tofrom: d)
#pragma omp parallel for
    for (i = 0; i < 3; i++) {
        // 4, 0/random, 8
        printf("Test1 %d, %d, %d.\n", b, c, d);
        b = 40;
        c = 60;
        d = 80;
        // 40, 60, 80
        printf("Test2 %d, %d, %d.\n", b, c, d);
    }

    // 4, 60, 80
    printf("Test3 %d, %d, %d.\n", b, c, d);

    return 0;
}
