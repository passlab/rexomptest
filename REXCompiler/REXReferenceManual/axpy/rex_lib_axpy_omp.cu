// Experimental test input for Accelerator directives
//  simplest scalar*vector operations
// Liao 1/15/2013
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
//#include <omp.h>
#define TEAM_NUM 1024
#define TEAM_SIZE 1024
#include "rex_nvidia.h" 

/* change this to do saxpy or daxpy : single precision or double precision*/
#define REAL double
#define VEC_LEN 1024000 //use a fixed number for now
/* zero out the entire vector */
void zero(double *,int );
/* initialize a vector with random floating point numbers */
void init(double *,int );
/*serial version */
void axpy(double *,double *,long ,double );
/* compare two arrays and return percentage of difference */
/*
REAL check(REAL*A, REAL*B, int n)
{
    int i;
    REAL diffsum =0.0, sum = 0.0;
    for (i = 0; i < n; i++) {
        diffsum += fabs(A[i] - B[i]);
        sum += fabs(B[i]);
    }
    return diffsum/sum;
}
*/
int main(int ,char *[]);
#ifdef __cplusplus
extern "C" {
#endif
__device__ char OUT__1__5362__axpy__46__kernel___exec_mode = 0;

__global__ void OUT__1__5362__axpy__46__kernel__(long *np__,double *ap__,int *ip__,double *_dev_x,double *_dev_y)
{
  int _p_i;
  int _dev_lower;
  int _dev_upper;
  int _dev_loop_chunk_size;
  int _dev_loop_sched_index;
  int _dev_loop_stride;
  int _dev_thread_num = getCUDABlockThreadCount(1);
  int _dev_thread_id = getLoopIndexFromCUDAVariables(1);
  XOMP_static_sched_init(0, *np__ - 1,1,1,_dev_thread_num,_dev_thread_id,&_dev_loop_chunk_size,&_dev_loop_sched_index,&_dev_loop_stride);
  while(XOMP_static_sched_next(&_dev_loop_sched_index, *np__ - 1,1,_dev_loop_stride,_dev_loop_chunk_size,_dev_thread_num,_dev_thread_id,&_dev_lower,&_dev_upper))
    for (_p_i = _dev_lower; ((long )_p_i) <= _dev_upper; _p_i += 1) {
      _dev_y[_p_i - 0] +=  *ap__ * _dev_x[_p_i - 0];
    }
}
__device__ char OUT__2__5362__axpy__45__kernel___exec_mode = 0;

__global__ void OUT__2__5362__axpy__45__kernel__(long *np__,double *ap__,int *ip__,double *_dev_x,double *_dev_y)
{
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    OUT__1__5362__axpy__46__kernel__<<<_num_blocks_,_threads_per_block_>>>(np__,ap__,ip__,_dev_x,_dev_y);
  }
    cudaDeviceSynchronize();
}
#ifdef __cplusplus
}
#endif
