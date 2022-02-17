// create a list of 64 numbers, and only sum the even ones
#include <stdio.h>
#include <stdlib.h>

#define N 32000
#define SCALE 16

int main() {
    srand(time(NULL));
    float *numbers = malloc(sizeof(float)*N);
    float *result1 = malloc(sizeof(float)*N);
    float *result2 = malloc(sizeof(float)*N);
    int *mask = malloc(sizeof(int)*N);
    
    // Init the numbers
    for (int i = 0; i<N; i++) numbers[i] = rand() % 10;
    for (int i = 0; i<N; i++) { result1[i] = 0; result2[i] = 0; }
    for (int i = 0; i<N; i++) mask[i] = rand() % N;
    
    for (int i = 0; i<SCALE; i++) printf("%.1f ", numbers[i]);
    puts("\n---");
    for (int i = 0; i<SCALE; i++) printf("%d ", mask[i]);
    puts("\n---");
    puts("---------------------------------------------");
    
    //Serial
    for (int i = 0; i<SCALE; i++) {
        result1[mask[i]] = numbers[mask[i]];
    }
    
#pragma omp simd simdlen(SCALE)
    for (int i = 0; i<SCALE; i++) {
        result2[mask[i]] = numbers[mask[i]];
    }
    
    // print
    for (int i = 0; i<SCALE; i++) printf("%.1f ", result1[i]);
    puts("\n---");
    for (int i = 0; i<SCALE; i++) printf("%.1f ", result2[i]);
    puts("\n---");
    
    int errors = 0;
    for (int i = 0; i<SCALE; i++) {
        if (result1[i] != result2[i]) ++errors;
    }
    printf("Errors: %d\n", errors);
    
    //printf("Result1: %f | Result2: %f\n", result1, result2);
    
    return 0;
}
