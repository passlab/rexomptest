#include <stdio.h>
#include <stdlib.h>
#include "xomp_cuda_lib.cu" 
#include "xomp_cuda_lib_inlined.cu" 
#include "rex_kmp.h" 
int main(int ,char **);
#ifdef __cplusplus
extern "C" {
#endif
__device__ int32_t omptarget_device_environment;
__device__ char OUT__1__8060__main__15__kernel___exec_mode = 0;

__global__ void OUT__1__8060__main__15__kernel__(int b,int c,int d)
{
  int _p_i;
  int _dev_lower;
  int _dev_upper;
  int _dev_loop_chunk_size;
  int _dev_loop_sched_index;
  int _dev_loop_stride;
  int _dev_thread_num = getCUDABlockThreadCount(1);
  int _dev_thread_id = getLoopIndexFromCUDAVariables(1);
  XOMP_static_sched_init(0,2,1,1,_dev_thread_num,_dev_thread_id,&_dev_loop_chunk_size,&_dev_loop_sched_index,&_dev_loop_stride);
  while(XOMP_static_sched_next(&_dev_loop_sched_index,2,1,_dev_loop_stride,_dev_loop_chunk_size,_dev_thread_num,_dev_thread_id,&_dev_lower,&_dev_upper))
    for (_p_i = _dev_lower; _p_i <= _dev_upper; _p_i += 1) {
// 4, 0/random, 8
      printf("Test1 %d, %d, %d.\n",b,c,d);
      b = 40;
      c = 60;
      d = 80;
// 40, 60, 80
      printf("Test2 %d, %d, %d.\n",b,c,d);
    }
}
#ifdef __cplusplus
}
#endif
