#include "rex_kmp.h" 
char OUT__2__4980__matvec_omp_gpu__62__id__ = 0;
struct __tgt_offload_entry OUT__2__4980__matvec_omp_gpu__62__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__2__4980__matvec_omp_gpu__62__id__)), "OUT__2__4980__matvec_omp_gpu__62__kernel__", 0, 0, 0};
char OUT__1__4980__matvec_omp_gpu__63__id__ = 0;
struct __tgt_offload_entry OUT__1__4980__matvec_omp_gpu__63__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__1__4980__matvec_omp_gpu__63__id__)), "OUT__1__4980__matvec_omp_gpu__63__kernel__", 0, 0, 0};
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

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,(void *)0);
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
#define REAL float

void init(int N,float *A)
{
  int i;
  int j;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      A[i * N + j] = ((float )(drand48()));
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
extern void OUT__3__4980__matvec_omp_cpu__50__(int *__global_tid,int *__bound_tid,int *Np__,float **Ap__,float **Bp__,float **Cp__);

void matvec_omp_cpu(int N,float *A,float *B,float *C)
{
  int i;
  int j;
  int size = N * N;
  void *__out_argv1__4980__[4];
  __out_argv1__4980__[0] = ((void *)(&C));
  __out_argv1__4980__[1] = ((void *)(&B));
  __out_argv1__4980__[2] = ((void *)(&A));
  __out_argv1__4980__[3] = ((void *)(&N));
  __kmpc_fork_call(0,4,OUT__3__4980__matvec_omp_cpu__50__,&N,&A,&B,&C);
}

void matvec_omp_gpu(int N,float *A,float *B,float *C)
{
  int i;
  int j;
  int size = N * N;
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1;
    int _num_blocks_ = 1;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)(&OUT__2__4980__matvec_omp_gpu__62__id__);
    void *__args_base[] = {&N, &i, &j, A, B, C};
    void *__args[] = {&N, &i, &j, A + 0, B + 0, C + 0};
    int64_t __arg_sizes[] = {((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(float ) * size)), ((int64_t )(sizeof(float ) * N)), ((int64_t )(sizeof(float ) * N))};
    int64_t __arg_types[] = {33, 33, 33, 33, 33, 34};
    int32_t __arg_num = 6;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_num_blocks_,_threads_per_block_);
  }
}

int main(int argc,char *argv[])
{
  int status = 0;
  int N = 512;
  if (argc < 2) {
    fprintf(stderr,"Usage: mv <n> (default %d)\n",N);
    exit(1);
  }
  N = atoi(argv[1]);
  double elapsed_omp_cpu;
  double elapsed_omp_gpu;
  float *A = (malloc(sizeof(float ) * N * N));
  float *B = (malloc(sizeof(float ) * N * N));
  float *C_cilkplus = (malloc(sizeof(float ) * N));
  float *C_serial = (malloc(sizeof(float ) * N));
  srand48((1 << 12));
  init(N,A);
  init(N,B);
  int i;
  int num_runs = 10;
  elapsed_omp_cpu = read_timer_ms();
  for (i = 0; i < num_runs; i++) 
    matvec_omp_cpu(N,A,B,C_serial);
  elapsed_omp_cpu = (read_timer_ms() - elapsed_omp_cpu) / num_runs;
  elapsed_omp_gpu = read_timer_ms();
  for (i = 0; i < num_runs; i++) 
    matvec_omp_gpu(N,A,B,C_cilkplus);
  elapsed_omp_gpu = (read_timer_ms() - elapsed_omp_gpu) / num_runs;
  printf("======================================================================================================\n");
  printf("\tMatrix Vector Addition: A[N][N] * B[N] = C[N], N=%d\n",N);
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("Performance:\t\tRuntime (ms)\t MFLOPS\n");
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("matvec_omp_cpu:\t\t%4f\t%4f\n",elapsed_omp_cpu,2.0 * N * N / (1.0e3 * elapsed_omp_cpu));
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("matvec_omp_gpu:\t\t%4f\t%4f\n",elapsed_omp_gpu,2.0 * N * N / (1.0e3 * elapsed_omp_gpu));
//printf("Check:%f\n",check(C_serial,C_cilkplus,N));
  return 0;
}
