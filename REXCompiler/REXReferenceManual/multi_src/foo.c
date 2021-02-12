#include <stdio.h>
#include <stdlib.h>

void foo() {
    int i;
#pragma omp target
#pragma omp parallel for
    for (i = 0; i < 2; i++) {
        printf("Test 1.\n");
    }
}
