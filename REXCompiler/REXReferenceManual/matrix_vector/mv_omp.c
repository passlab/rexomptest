/*
 * matrix vector
 * A[N][N] * B[N] = C[N]
 *
 */
#include <stdio.h>
#include <stdlib.h>
//#include <math.h>
#include <sys/time.h>
#include <string.h>
#define TEAM_NUM 1024
#define TEAM_SIZE 1024


/* read timer in ms */
static double read_timer_ms() {
    struct timeval timer;
    gettimeofday(&timer, NULL);
    return (double)timer.tv_sec * 1000.0 + (double)timer.tv_usec / 1000.0;
}

#define REAL float

void init(int N, REAL *A) {
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i*N+j] = (REAL) drand48();
        }
    }
}

/*
REAL check(REAL*A, REAL*B, int n)
{
    int i;
    REAL diffsum =0.0, sum = 0.0;
    for (i = 0; i < n; i++) {
        diffsum += fabs(A[i] - B[i]);
        sum += fabs(B[i]);
    }
    return diffsum;
}
*/

void matvec_omp_cpu(int N, REAL *A, REAL *B, REAL *C) {
    int i,j;
    int size = N*N;
#pragma omp parallel for shared(N,A,B,C) private(i,j)
    for (i = 0; i < N; i++) {
        REAL temp = 0.0;
        for (j = 0; j < N; j++)
            temp += A[i * N + j] * B[j];
        C[i] = temp;
    }
}

void matvec_omp_gpu(int N, REAL *A, REAL *B, REAL *C) {
    int i,j;
    int size = N*N;
#pragma omp target map(to: N, A[0:size], B[0:N]) map(from: C[0:N])
#pragma omp parallel for num_threads(TEAM_SIZE)
    for (i = 0; i < N; i++) {
        REAL temp = 0.0;
        for (j = 0; j < N; j++)
            temp += A[i * N + j] * B[j];
        C[i] = temp;
    }
}

int main(int argc, char *argv[]) {
    int N = 512;

    if (argc < 2) {
        fprintf(stderr, "Usage: mv <n> (default %d)\n", N);
        exit(1);
    }
    N = atoi(argv[1]);

    double elapsed_omp_cpu;
    double elapsed_omp_gpu;

    REAL *A = malloc(sizeof(REAL)*N*N);
    REAL *B = malloc(sizeof(REAL)*N*N);
    REAL *C_cilkplus = malloc(sizeof(REAL)*N);
    REAL *C_serial = malloc(sizeof(REAL)*N);

    srand48((1 << 12));
    init(N, A);
    init(N, B);

    int i;
    int num_runs = 10;
    
    elapsed_omp_cpu = read_timer_ms();
    for (i=0; i<num_runs; i++)
        matvec_omp_cpu(N, A, B, C_serial);
    elapsed_omp_cpu = (read_timer_ms() - elapsed_omp_cpu)/num_runs;

    elapsed_omp_gpu = read_timer_ms();
    for (i=0; i<num_runs; i++)
        matvec_omp_gpu(N, A, B, C_cilkplus);
    elapsed_omp_gpu = (read_timer_ms() - elapsed_omp_gpu)/num_runs;


    printf("======================================================================================================\n");
    printf("\tMatrix Vector Addition: A[N][N] * B[N] = C[N], N=%d\n", N);
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("Performance:\t\tRuntime (ms)\t MFLOPS\n");
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("matvec_omp_cpu:\t\t%4f\t%4f\n", elapsed_omp_cpu, ((((2.0) * N) * N) / (1.0e3 * elapsed_omp_cpu)));
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("matvec_omp_gpu:\t\t%4f\t%4f\n", elapsed_omp_gpu, ((((2.0) * N) * N) / (1.0e3 * elapsed_omp_gpu)));
    //printf("Check:%f\n",check(C_serial,C_cilkplus,N));
    return 0;
}


