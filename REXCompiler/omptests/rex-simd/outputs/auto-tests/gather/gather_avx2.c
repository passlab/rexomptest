// create a list of 64 numbers, and only sum the even ones
#include <stdio.h>
#include <stdlib.h>

#define N 32000

int main() {
    srand(time(NULL));
    float *numbers = malloc(sizeof(float)*N);
    int *mask = malloc(sizeof(int)*N);
    
    // Init the numbers
    for (int i = 0; i<N; i++) numbers[i] = rand() % 10;
    for (int i = 0; i<N; i++) mask[i] = rand() % N;
    
    /*for (int i = 0; i<8; i++) printf("%.1f ", numbers[i]);
    puts("\n---");
    for (int i = 0; i<8; i++) printf("%d ", mask[i]);
    puts("\n---");*/
    
    //Serial
    float result1 = 0;
    for (int i = 0; i<N; i++) {
        result1 += numbers[mask[i]];
    }
    
    float result2 = 0;
#pragma omp simd reduction(+:result2) simdlen(8)
    for (int i = 0; i<N; i++) {
        result2 += numbers[mask[i]];
    }
    
    // print
    printf("Result1: %f | Result2: %f\n", result1, result2);
    
    return 0;
} 
