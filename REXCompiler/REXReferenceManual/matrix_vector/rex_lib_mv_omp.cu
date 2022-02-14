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
#include "rex_nvidia.h" 

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,((void *)0));
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
#define REAL float
void init(int ,float *);
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
void matvec_omp_cpu(int ,float *,float *,float *);
void matvec_omp_gpu(int ,float *,float *,float *);
int main(int ,char *[]);
#ifdef __cplusplus
extern "C" {
#endif
__device__ char OUT__1__4980__matvec_omp_gpu__63__kernel___exec_mode = 0;

__global__ void OUT__1__4980__matvec_omp_gpu__63__kernel__(int *Np__,int *ip__,int *jp__,float *_dev_A,float *_dev_B,float *_dev_C)
{
  int _p_i;
  int _p_j;
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
      float temp = (float )0.0;
      for (_p_j = 0; _p_j <  *Np__; _p_j++) 
        temp += _dev_A[_p_i *  *Np__ + _p_j - 0] * _dev_B[_p_j - 0];
      _dev_C[_p_i - 0] = temp;
    }
}
__device__ char OUT__2__4980__matvec_omp_gpu__62__kernel___exec_mode = 0;

__global__ void OUT__2__4980__matvec_omp_gpu__62__kernel__(int *Np__,int *ip__,int *jp__,float *_dev_A,float *_dev_B,float *_dev_C)
{
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 1;
    OUT__1__4980__matvec_omp_gpu__63__kernel__<<<_num_blocks_,_threads_per_block_>>>(Np__,ip__,jp__,_dev_A,_dev_B,_dev_C);
  }
}
#ifdef __cplusplus
}
#endif
