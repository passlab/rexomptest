/*
 * Square matrix multiplication
 * A[N][N] * B[N][N] = C[N][N]
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>

#define ALLOWED_DIFF 0.0001
#define TEAM_NUM 1024
#define TEAM_SIZE 1024

/* read timer in ms */
static double read_timer_ms() {
    struct timeval timer;
    gettimeofday(&timer, NULL);
    return (double)timer.tv_sec * 1000.0 + (double)timer.tv_usec / 1000.0;
}

#define REAL double

void init(int N, REAL *A) {
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i*N+j] = (REAL) drand48();
        }
    }
}


/*
void matmul_omp(int N, REAL *A, REAL *B, REAL *C) {
    int i,j,k;
    REAL temp;
#pragma omp parallel for shared(N,A,B,C) private(i,j,k,temp) collapse(2)
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            temp = 0;
            for (k = 0; k < N; k++) {
                temp += (A[i * N + k] * B[k * N + j]);
            }
            C[i * N + j] = temp;
        }
    }
}
*/

void matmul_omp_target(int N, REAL *A, REAL *B, REAL *C) {
    int size = N * N;
    int i, j, k;
#pragma omp target map(to: N, A[0:size], B[0:size]) map(from: C[0:size])
#pragma omp parallel for num_threads(TEAM_SIZE)
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            REAL temp = 0;
            for (k = 0; k < N; k++) {
                temp += (A[i * N + k] * B[k * N + j]);
            }
            C[i * N + j] = temp;
        }
    }
}

int main(int argc, char *argv[]) {
    int N = 512;

    if (argc < 2) {
        fprintf(stderr, "Usage: mm <n> (default %d)\n", N);
        exit(1);
    }
    N = atoi(argv[1]);

    double elapsed_omp;
    double elapsed_omp_target;

    REAL *A = malloc(sizeof(REAL)*N*N);
    REAL *B = malloc(sizeof(REAL)*N*N);
    REAL *C_omp = malloc(sizeof(REAL)*N*N);
    REAL *C_omp_target = malloc(sizeof(REAL)*N*N);

    srand48((1 << 12));
    init(N, A);
    init(N, B);

    int i, j;
    int num_runs = 10;

    elapsed_omp = read_timer_ms();
    for (i=0; i<num_runs; i++)
        //matmul_omp(N, A, B, C_omp);
    elapsed_omp = (read_timer_ms() - elapsed_omp)/num_runs;
    /* you should add the call to each function and time the execution */

    elapsed_omp_target = read_timer_ms();
    for (i=0; i<num_runs; i++)
        matmul_omp_target(N, A, B, C_omp_target);
    elapsed_omp_target = (read_timer_ms() - elapsed_omp_target)/num_runs;
    
    /*
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            if (fabs(C_omp_target[i * N + j] - C_omp[i * N + j]) > ALLOWED_DIFF) {
                printf("C_omp_target[%d][%d]: %g, C_omp[%d][%d]: %g\n", i, j, C_omp_target[i * N + j], i, j, C_omp[i * N + j]);
                break;
            }
        }
    };
    */

    printf("======================================================================================================\n");
    printf("\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n", N);
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("Performance:\t\tRuntime (ms)\t MFLOPS\n");
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("matmul_omp:\t\t%4f\t%4f\n", elapsed_omp, ((((2.0 * N) * N) * N) / (1.0e3 * elapsed_omp)));
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("matmul_omp_target:\t%4f\t%4f\n", elapsed_omp_target, ((((2.0 * N) * N) * N) / (1.0e3 * elapsed_omp_target)));
    return 0;
}


