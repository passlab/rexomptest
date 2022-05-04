/*
 * Square matrix multiplication
 * A[N][N] * B[N][N] = C[N][N]
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>

#define N 1024
//#define N 16

// read timer in second
double read_timer() {
    struct timeb tm;
    ftime(&tm);
    return (double) tm.time + (double) tm.millitm / 1000.0;
}

void init(float **A) {
    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < N; j++) {
            A[i][j] = (float)rand()/(float)(RAND_MAX/10.0);
        }
    }
}


void matmul_simd(float **A, float **B, float **C) {
    float temp;

    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < N; j++) {
            temp = 0;
            size_t k = 0;
            #pragma omp simd reduction(+:temp) private(k)
            for (k = 0; k < N; k++) {
                temp += A[i][k] * B[j][k];
            }
            C[i][j] = temp;
        }
    }
}

void matmul_serial(float **A, float **B, float **C) {
    float temp;

    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < N; j++) {
            temp = 0;
            for (size_t k = 0; k < N; k++) {
                temp += A[i][k] * B[j][k];
            }
            C[i][j] = temp;
        }
    }
}

float check(float **A, float **B){
    float difference = 0;
    for(size_t i = 0;i<N; i++){
        for (size_t j = 0; j<N; j++)
        { difference += A[i][j]- B[i][j];}
    }
    return difference;
}

// Main
int main(int argc, char *argv[]) {
    //Set everything up
    float **A = malloc(sizeof(float*)*N);
    float **B = malloc(sizeof(float*)*N);
    float **C_simd = malloc(sizeof(float*)*N);
    float **C_serial = malloc(sizeof(float*)*N);
    float **BT = malloc(sizeof(float*)*N);
    
    for (size_t i = 0; i<N; i++) {
        A[i] = malloc(sizeof(float)*N);
        B[i] = malloc(sizeof(float)*N);
        C_simd[i] = malloc(sizeof(float)*N);
        C_serial[i] = malloc(sizeof(float)*N);
        BT[i] = malloc(sizeof(float)*N);
    }
    

    srand(time(NULL));
    init(A);
    init(B);
    for(size_t line = 0; line<N; line++){
        for(size_t col = 0; col<N; col++){
            BT[line][col] = B[col][line];
        }
    }
    int num_runs = 20;
    
    //Warming up
    matmul_simd(A, BT, C_simd);
    matmul_serial(A, BT, C_serial);
    

    double elapsed = 0;
    double elapsed1 = read_timer();
    for (int i=0; i<num_runs; i++) {
        fprintf(stderr, "%d ", i);
        matmul_simd(A, BT, C_simd);
        fprintf(stderr, "(%f,%f,%f)", C_simd[0], C_simd[N-10], C_simd[N/10]);
    }
    fprintf(stderr, "\n");
    elapsed += (read_timer() - elapsed1);
    
    double elapsed_serial = 0;
    double elapsed_serial1 = read_timer();
    for (int i=0; i<num_runs; i++)
        matmul_serial(A, BT, C_serial);
    elapsed_serial += (read_timer() - elapsed_serial1);
    
    double gflops_omp = ((((2.0 * N) * N) * N * num_runs) / (1.0e9 * elapsed));
    double gflops_serial = ((((2.0 * N) * N) * N * num_runs) / (1.0e9 * elapsed_serial));
    
    /*printf("======================================================================================================\n");
    printf("\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n", N);
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("Performance:\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("matmul_omp:\t\t%4f\t%4f\n", elapsed/num_runs, gflops_omp);
    printf("matmul_serial:\t\t%4f\t%4f\n", elapsed_serial/num_runs, gflops_serial);
    printf("Correctness check: %f\n", check(C_simd,C_serial));*/
    printf("%4f\n", elapsed/num_runs);
    
    return 0;
}

