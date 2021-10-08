//axpy.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>

#define N_RUNS 1000
#define N 1200

// read timer in second
double read_timer() {
    struct timeb tm;
    ftime(&tm);
    return (double) tm.time + (double) tm.millitm / 1000.0;
}

//Create a matrix and a vector and fill with random numbers
void init(int *X, int *Y) {
    for (int i = 0; i<N; i++) {
        X[i] = (int)rand()/(int)(RAND_MAX/10.0);
        Y[i] = (int)rand()/(int)(RAND_MAX/10.0);
    }
}

//Our sum function- what it does is pretty straight-forward.
void axpy(int *X, int *Y, int a) {
    #pragma omp simd
    for (int i = 0; i<N; i++) {
        Y[i] += a * X[i];
    }
}

// Debug functions
void axpy_serial(int *X, int *Y, int a) {
    for (int i = 0; i<N; i++) {
        Y[i] += a * X[i];
    }
}

void print_vector(int *vector) {
    printf("[");
    for (int i = 0; i<8; i++) {
        printf("%d ", vector[i]);
    }
    puts("]");
}

int check(int *A, int *B){
    int difference = 0;
    for(int i = 0;i<N; i++){
        difference += A[i]- B[i];
    }
    return difference;
}

int main(int argc, char **argv) {
    //Set everything up
    int *X = malloc(sizeof(int)*N);
    int *Y = malloc(sizeof(int)*N);
    int *Y_serial = malloc(sizeof(int)*N);
    int a = 3;
    
    srand(time(NULL));
    init(X, Y);
    for (int i = 0; i<N; i++) Y_serial[i] = Y[i];
    
    print_vector(Y);
    print_vector(X);
    printf("%d\n", a);
    puts("=\n");
    
    double start = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        axpy(X, Y, a);
    double t = (read_timer() - start);
    
    double start_serial = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        axpy_serial(X, Y_serial, a);
    double t_serial = (read_timer() - start_serial);
    
    print_vector(Y);
    puts("---------------------------------");
    print_vector(Y_serial);
    
    double gflops = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t);
    double gflops_serial = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t_serial);
    
    printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("AXPY (SIMD):\t\t%4f\t%4f\n", t, gflops);
    printf("AXPY (Serial):\t\t%4f\t%4f\n", t_serial, gflops_serial);
    printf("Correctness check: %d\n", check(Y,Y_serial));
    
    free(X);
    free(Y);
    free(Y_serial);
    
    return 0;    
}

