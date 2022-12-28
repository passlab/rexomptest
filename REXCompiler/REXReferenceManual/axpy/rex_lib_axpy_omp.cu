// Experimental test input for Accelerator directives
//  simplest scalar*vector operations
// Liao 1/15/2013
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#define TEAM_NUM 1024
#define TEAM_SIZE 1024
#include "rex_nvidia.h" 

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,((void *)0));
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
/* change this to do saxpy or daxpy : single precision or double precision*/
#define REAL double
#define VEC_LEN 1024000 // use a fixed number for now
/* zero out the entire vector */
void zero(double *,int );
/* initialize a vector with random floating point numbers */
void init(double *,int );
/* serial version */
void axpy(double *,double *,long ,double );
/* omp version */
void axpy_omp(double *,double *,long ,double );
/* compare two arrays and return percentage of difference */
double check(double *,double *,int );
int main(int ,char *[]);
#ifdef __cplusplus
extern "C" {
#endif
__device__ char OUT__1__7822__axpy_omp__49__kernel___exec_mode = 0;

__global__ void OUT__1__7822__axpy_omp__49__kernel__(long *np__,double *ap__,double *_dev_x,double *_dev_y)
{
  typedef int int64_t;
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
      _dev_y[_p_i] +=  *ap__ * _dev_x[_p_i];
    }
}
#ifdef __cplusplus
}
#endif
