#include <stdio.h>
#include <stdlib.h>
#include "rex_nvidia.h" 
void foo();
#ifdef __cplusplus
extern "C" {
#endif
__device__ char OUT__1__7655__foo__7__kernel___exec_mode = 0;

__global__ void OUT__1__7655__foo__7__kernel__()
{
  int _p_i;
  int _dev_lower;
  int _dev_upper;
  int _dev_loop_chunk_size;
  int _dev_loop_sched_index;
  int _dev_loop_stride;
  int _dev_thread_num = getCUDABlockThreadCount(1);
  int _dev_thread_id = getLoopIndexFromCUDAVariables(1);
  XOMP_static_sched_init(0,1,1,1,_dev_thread_num,_dev_thread_id,&_dev_loop_chunk_size,&_dev_loop_sched_index,&_dev_loop_stride);
  while(XOMP_static_sched_next(&_dev_loop_sched_index,1,1,_dev_loop_stride,_dev_loop_chunk_size,_dev_thread_num,_dev_thread_id,&_dev_lower,&_dev_upper))
    for (_p_i = _dev_lower; _p_i <= _dev_upper; _p_i += 1) {
      printf("Test 1.\n");
    }
}
#ifdef __cplusplus
}
#endif
