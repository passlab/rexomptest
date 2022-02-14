#include "rex_kmp.h" 
char OUT__2__4962__matmul_omp_target__55__id__ = 0;
struct __tgt_offload_entry OUT__2__4962__matmul_omp_target__55__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__2__4962__matmul_omp_target__55__id__)), "OUT__2__4962__matmul_omp_target__55__kernel__", 0, 0, 0};
char OUT__1__4962__matmul_omp_target__56__id__ = 0;
struct __tgt_offload_entry OUT__1__4962__matmul_omp_target__56__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__1__4962__matmul_omp_target__56__id__)), "OUT__1__4962__matmul_omp_target__56__kernel__", 0, 0, 0};
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

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,(void *)0);
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
#define REAL double

void init(int N,double *A)
{
  int i;
  int j;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      A[i * N + j] = ((double )(drand48()));
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

void matmul_omp_target(int N,double *A,double *B,double *C)
{
  int size = N * N;
  int i;
  int j;
  int k;
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1;
    int _num_blocks_ = 1;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)(&OUT__2__4962__matmul_omp_target__55__id__);
    void *__args_base[] = {&N, &i, &j, &k, A, B, C};
    void *__args[] = {&N, &i, &j, &k, A + 0, B + 0, C + 0};
    int64_t __arg_sizes[] = {((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(double ) * size)), ((int64_t )(sizeof(double ) * size)), ((int64_t )(sizeof(double ) * size))};
    int64_t __arg_types[] = {33, 33, 33, 33, 33, 33, 34};
    int32_t __arg_num = 7;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_num_blocks_,_threads_per_block_);
  }
}

int main(int argc,char *argv[])
{
  int status = 0;
  int N = 512;
  if (argc < 2) {
    fprintf(stderr,"Usage: mm <n> (default %d)\n",N);
    exit(1);
  }
  N = atoi(argv[1]);
  double elapsed_omp;
  double elapsed_omp_target;
  double *A = (malloc(sizeof(double ) * N * N));
  double *B = (malloc(sizeof(double ) * N * N));
  double *C_omp = (malloc(sizeof(double ) * N * N));
  double *C_omp_target = (malloc(sizeof(double ) * N * N));
  srand48((1 << 12));
  init(N,A);
  init(N,B);
  int i;
  int j;
  int num_runs = 10;
  elapsed_omp = read_timer_ms();
  for (i = 0; i < num_runs; i++) 
//matmul_omp(N, A, B, C_omp);
    elapsed_omp = (read_timer_ms() - elapsed_omp) / num_runs;
/* you should add the call to each function and time the execution */
  elapsed_omp_target = read_timer_ms();
  for (i = 0; i < num_runs; i++) 
    matmul_omp_target(N,A,B,C_omp_target);
  elapsed_omp_target = (read_timer_ms() - elapsed_omp_target) / num_runs;
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
  printf("\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n",N);
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("Performance:\t\tRuntime (ms)\t MFLOPS\n");
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("matmul_omp:\t\t%4f\t%4f\n",elapsed_omp,2.0 * N * N * N / (1.0e3 * elapsed_omp));
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("matmul_omp_target:\t%4f\t%4f\n",elapsed_omp_target,2.0 * N * N * N / (1.0e3 * elapsed_omp_target));
  return 0;
}
