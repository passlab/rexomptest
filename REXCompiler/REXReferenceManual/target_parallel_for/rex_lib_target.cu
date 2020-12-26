#include <stdio.h>
#include <stdlib.h>
#include "xomp_cuda_lib.cu" 
#include "xomp_cuda_lib_inlined.cu" 
#include "omptarget.h" 
#include "rex_kmp.h" 
int main(int ,char **);
#ifdef __cplusplus
extern "C" {
#endif
__device__ int32_t omptarget_device_environment;
__device__ char OUT__1__9009__main__7__kernel___exec_mode = 0;

__global__ void OUT__1__9009__main__7__kernel__()
{
  int _p_i;
  int _dev_lower;
  int _dev_upper;
  int _dev_loop_chunk_size;
  int _dev_loop_sched_index;
  int _dev_loop_stride;
  int _dev_thread_num = getCUDABlockThreadCount(1);
  int _dev_thread_id = getLoopIndexFromCUDAVariables(1);
  XOMP_static_sched_init(0,9,1,1,_dev_thread_num,_dev_thread_id,&_dev_loop_chunk_size,&_dev_loop_sched_index,&_dev_loop_stride);
  while(XOMP_static_sched_next(&_dev_loop_sched_index,9,1,_dev_loop_stride,_dev_loop_chunk_size,_dev_thread_num,_dev_thread_id,&_dev_lower,&_dev_upper))
    for (_p_i = _dev_lower; _p_i <= _dev_upper; _p_i += 1) {
      printf("Test.\n");
    }
}

void OUT__1__9009__main__7__()
{
/* Launch CUDA kernel ... */
  int _threads_per_block_ = 1024;
  int _num_blocks_ = 256;
  void *__entry_ptr = (void *)(&OUT__1__9009__main__7__);
  char __cuda_entry[] = "OUT__1__9009__main__7__kernel__";
  int64_t __device_id = 0;
  struct __tgt_offload_entry __omp_offload_entry = {((void *)(&OUT__1__9009__main__7__)), __cuda_entry, 0, 0, 0};
  struct __tgt_offload_entry *__start_omp_offloading_entries = &__omp_offload_entry;
  struct __tgt_offload_entry *__stop_omp_offloading_entries = &__start_omp_offloading_entries[1];
  char cuda_entry_name[] = "rex_lib_target.cubin";
  struct __tgt_bin_desc *bin_desc = register_cubin(cuda_entry_name,__start_omp_offloading_entries,__stop_omp_offloading_entries);
  void *__host_ptr = __entry_ptr;
  void *__args_base[] = {};
  void *__args[] = {};
  int64_t __arg_sizes[] = {};
  int64_t __arg_types[] = {};
  int32_t __arg_num = 0;
  __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  __tgt_unregister_lib(bin_desc);
}
#ifdef __cplusplus
}
#endif
