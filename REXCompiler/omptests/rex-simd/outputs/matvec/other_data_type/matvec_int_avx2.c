//matvec.c
//Multiplies a matrix by a vector
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
void init(int **matrix, int *vector) {
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            matrix[i][j] = (int)rand()/(int)(RAND_MAX/10.0);
        }
        
        vector[i] = (int)rand()/(int)(RAND_MAX/10.0);
    }
}

//Our sum function- what it does is pretty straight-forward.
void sum(int **matrix, int *vector, int **dest) {
    int s = 0;
    
    for (int i = 0; i<N; i++) {
        s = 0;
        
        #pragma omp simd simdlen(8)
        for (int j = 0; j<N; j++) {
            dest[i][j] = matrix[i][j] * vector[j];
        }
    }
}

// Debug functions
void serial(int **matrix, int *vector, int **dest) {
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            dest[i][j] = matrix[i][j] * vector[j];
        }
    }
}

void print_matrix(int **matrix) {
    for (int i = 0; i<8; i++) {
        printf("[");
        for (int j = 0; j<8; j++) {
            printf("%d ", matrix[i][j]);
        }
        puts("]");
    }
    puts("");
}

void print_vector(int *vector) {
    printf("[");
    for (int i = 0; i<8; i++) {
        printf("%d ", vector[i]);
    }
    puts("]");
}

int check(int **A, int **B){
    int difference = 0;
    for(int i = 0;i<N; i++){
        for (int j = 0; j<N; j++)
        { difference += A[i][j]- B[i][j];}
    }
    return difference;
}

int main(int argc, char **argv) {
    //Set everything up
    int **dest_matrix = malloc(sizeof(int*)*N);
    int **serial_matrix = malloc(sizeof(int*)*N);
    int **matrix = malloc(sizeof(int*)*N);
    int *vector = malloc(sizeof(int)*N);
    
    for (int i = 0; i<N; i++) {
        dest_matrix[i] = malloc(sizeof(int)*N);
        serial_matrix[i] = malloc(sizeof(int)*N);
        matrix[i] = malloc(sizeof(int)*N);
    }
    
    srand(time(NULL));
    init(matrix, vector);
    
    double start = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        sum(matrix, vector, dest_matrix);
    double t = (read_timer() - start);
    
    double start_serial = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        serial(matrix, vector, serial_matrix);
    double t_serial = (read_timer() - start_serial);
    
    print_matrix(matrix);
    print_vector(vector);
    puts("=\n");
    print_matrix(dest_matrix);
    puts("---------------------------------");
    print_matrix(serial_matrix);
    
    double gflops = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t);
    double gflops_serial = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t_serial);
    
    printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("Matrix-vector (SIMD):\t\t%4f\t%4f\n", t, gflops);
    printf("Matrix-vector (Serial):\t\t%4f\t%4f\n", t_serial, gflops_serial);
    printf("Correctness check: %d\n", check(dest_matrix,serial_matrix));
    
    free(dest_matrix);
    free(serial_matrix);
    free(matrix);
    free(vector);
    
    return 0;    
}

