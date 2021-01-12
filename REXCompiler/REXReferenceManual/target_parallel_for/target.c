#include <stdio.h>
#include <stdlib.h>

int main (int argc, char** argv) {
    int i;
#pragma omp target
#pragma omp parallel for
    for (i = 0; i < 2; i++) {
        printf("Test 1.\n");
    }

#pragma omp target
#pragma omp parallel for
    for (i = 0; i < 6; i++) {
        printf("Test 2.\n");
    }

    return 0;
}
