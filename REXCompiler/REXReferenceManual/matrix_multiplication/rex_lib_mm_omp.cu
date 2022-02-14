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
#include "rex_nvidia.h" 

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,((void *)0));
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
#define REAL double
void init(int ,double *);
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
void matmul_omp_target(int ,double *,double *,double *);
int main(int ,char *[]);
#ifdef __cplusplus
extern "C" {
#endif
__device__ char OUT__1__4962__matmul_omp_target__56__kernel___exec_mode = 0;

__global__ void OUT__1__4962__matmul_omp_target__56__kernel__(int *Np__,int *ip__,int *jp__,int *kp__,double *_dev_A,double *_dev_B,double *_dev_C)
{
  int _p_i;
  int _p_j;
  int _p_k;
  int _dev_lower;
  int _dev_upper;
  int _dev_loop_chunk_size;
  int _dev_loop_sched_index;
  int _dev_loop_stride;
  int _dev_thread_num = getCUDABlockThreadCount(1);
  int _dev_thread_id = getLoopIndexFromCUDAVariables(1);
  XOMP_static_sched_init(0, *Np__ - 1,1,1,_dev_thread_num,_dev_thread_id,&_dev_loop_chunk_size,&_dev_loop_sched_index,&_dev_loop_stride);
  while(XOMP_static_sched_next(&_dev_loop_sched_index, *Np__ - 1,1,_dev_loop_stride,_dev_loop_chunk_size,_dev_thread_num,_dev_thread_id,&_dev_lower,&_dev_upper))
    for (_p_i = _dev_lower; _p_i <= _dev_upper; _p_i += 1) {
      for (_p_j = 0; _p_j <  *Np__; _p_j++) {
        double temp = (double )0;
        for (_p_k = 0; _p_k <  *Np__; _p_k++) {
          temp += _dev_A[_p_i *  *Np__ + _p_k - 0] * _dev_B[_p_k *  *Np__ + _p_j - 0];
        }
        _dev_C[_p_i *  *Np__ + _p_j - 0] = temp;
      }
    }
}
__device__ char OUT__2__4962__matmul_omp_target__55__kernel___exec_mode = 0;

__global__ void OUT__2__4962__matmul_omp_target__55__kernel__(int *Np__,int *ip__,int *jp__,int *kp__,double *_dev_A,double *_dev_B,double *_dev_C)
{
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 1;
    OUT__1__4962__matmul_omp_target__56__kernel__<<<_num_blocks_,_threads_per_block_>>>(Np__,ip__,jp__,kp__,_dev_A,_dev_B,_dev_C);
  }
}
#ifdef __cplusplus
}
#endif
