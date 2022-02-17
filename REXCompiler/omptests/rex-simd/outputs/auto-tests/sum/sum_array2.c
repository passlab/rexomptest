//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>

#define N_RUNS 1000
#define N 120000

// read timer in second
double read_timer() {
    struct timeb tm;
    ftime(&tm);
    return (double) tm.time + (double) tm.millitm / 1000.0;
}

//Create a matrix and a vector and fill with random numbers
void init(int *X) {
    for (int i = 0; i<N; i++) {
        X[i] = (int)rand()/(int)(RAND_MAX/10.0);
    }
}

//Our sum function- what it does is pretty straight-forward.
int sum(int *X, int *Y, int *answer) {
    int result = 0;
    
    #pragma omp simd simdlen(8)
    for (int i = 0; i<N; i++) {
        answer[i] = X[i] + Y[i] * 2;
    }
    
    return result;
}

// Debug functions
int sum_serial(int *X, int *Y, int *answer) {
    int result = 0;
    
    for (int i = 0; i<N; i++) {
        answer[i] = X[i] + Y[i] * 2;
    }
    
    return result;
}

void print_vector(int *vector) {
    printf("[");
    for (int i = 0; i<8; i++) {
        printf("%d ", vector[i]);
    }
    puts("]");
}

int check(int *serial, int *SIMD) {
    int diff = 0;
    for (int i = 0; i<N; i++) diff += serial[i] - SIMD[i];
    return diff;
}

int main(int argc, char **argv) {
    //Set everything up
    int *X = malloc(sizeof(int)*N);
    int *Y = malloc(sizeof(int)*N);
    int *answer = malloc(sizeof(int)*N);
    int *answer_serial = malloc(sizeof(int)*N);
    
    srand(time(NULL));
    init(X);
    init(Y);
    
    double start = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        sum(X, Y, answer);
    double t = (read_timer() - start);
    
    double start_serial = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        sum_serial(X, Y, answer_serial);
    double t_serial = (read_timer() - start_serial);
    
    printf("X: ");
    print_vector(X);
    puts("+");
    printf("Y: ");
    print_vector(Y);
    puts("=\n");
    printf("SIMD:\n");
    print_vector(answer);
    puts("---------------------------------");
    printf("Serial:\n");
    print_vector(answer_serial);
    
    double gflops = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t);
    double gflops_serial = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t_serial);
    
    printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("Sum (SIMD):\t\t%4f\t%4f\n", t, gflops);
    printf("Sum (Serial):\t\t%4f\t%4f\n", t_serial, gflops_serial);
    printf("Correctness:\t\t%d\n", check(answer_serial, answer));
    
    free(X);
    free(Y);
    free(answer);
    free(answer_serial);
    
    return 0;    
}

