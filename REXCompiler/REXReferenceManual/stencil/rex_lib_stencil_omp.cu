#include <stdio.h>
#include <stdlib.h>
//#include <math.h>
#include <string.h>
#include <sys/time.h>
#define REAL double
#define FILTER_HEIGHT 5
#define FILTER_WIDTH 5
#define TEST 10
#define PROBLEM 256
#define TEAM_NUM 1024
#define TEAM_SIZE 1024
// clang -fopenmp -fopenmp-targets=nvptx64 -Xopenmp-target -march=sm_35 --cuda-path=/usr/local/cuda -O3 -lpthread -fpermissive -msse4.1 stencil_metadirective.c -o stencil.out
// Usage: ./stencil.out <size>
// e.g. ./stencil.out 512
#include "rex_nvidia.h" 
void Convolution(const double *src,double *dst,int width,int height,const float *filter,int flt_width,int flt_height);
void ConvolutionMulti(const double *src,double *dst,int width,int height,const float *filter,int flt_width,int flt_height);
void stencil_omp(const double *src,double *dst,int width,int height,const float *filter,int flt_width,int flt_height);
void stencil_omp_target(const double *src,double *dst,int width,int height,const float *filter,int flt_width,int flt_height);

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,((void *)0));
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
void print_array(char *,char *,double *,int ,int );
void initialize(int ,int ,double *);
int main(int ,char *[]);
void stencil_omp_target(const double *,double *,int ,int ,const float *,int ,int );
#ifdef __cplusplus
extern "C" {
#endif
__device__ char OUT__1__6066__stencil_omp_target__109__kernel___exec_mode = 0;

__global__ void OUT__1__6066__stencil_omp_target__109__kernel__(int *widthp__,int *heightp__,int *flt_widthp__,int *flt_heightp__,int *ip__,int *jp__,double *_dev_src,double *_dev_dst,float *_dev_filter)
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
  XOMP_static_sched_init(0, *heightp__ - 1,1,1,_dev_thread_num,_dev_thread_id,&_dev_loop_chunk_size,&_dev_loop_sched_index,&_dev_loop_stride);
  while(XOMP_static_sched_next(&_dev_loop_sched_index, *heightp__ - 1,1,_dev_loop_stride,_dev_loop_chunk_size,_dev_thread_num,_dev_thread_id,&_dev_lower,&_dev_upper))
    for (_p_i = _dev_lower; _p_i <= _dev_upper; _p_i += 1) {
      for (_p_j = 0; _p_j <  *widthp__; _p_j++) {
        double sum = (double )0;
        int m;
        int n;
        for (n = 0; n <  *flt_widthp__; n++) {
          for (m = 0; m <  *flt_heightp__; m++) {
            int x = _p_j + n -  *flt_widthp__ / 2;
            int y = _p_i + m -  *flt_heightp__ / 2;
            if (x >= 0 && x <  *widthp__ && y >= 0 && y <  *heightp__) {
              int idx = m *  *flt_widthp__ + n;
              sum += _dev_src[y *  *widthp__ + x - 0] * ((double )_dev_filter[idx - 0]);
            }
          }
        }
        _dev_dst[_p_i *  *widthp__ + _p_j - 0] = sum;
      }
    }
}
__device__ char OUT__2__6066__stencil_omp_target__107__kernel___exec_mode = 0;

__global__ void OUT__2__6066__stencil_omp_target__107__kernel__(int *widthp__,int *heightp__,int *flt_widthp__,int *flt_heightp__,int *ip__,int *jp__,double *_dev_src,double *_dev_dst,float *_dev_filter)
{
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    OUT__1__6066__stencil_omp_target__109__kernel__<<<_num_blocks_,_threads_per_block_>>>(widthp__,heightp__,flt_widthp__,flt_heightp__,ip__,jp__,_dev_src,_dev_dst,_dev_filter);
  }
}
#ifdef __cplusplus
}
#endif
