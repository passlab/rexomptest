#include "rex_kmp.h" 
struct __tgt_bin_desc *__cubin_desc = 0;

void  __attribute__((destructor)) unregister_kernel_entries()
{
  __tgt_unregister_lib(__cubin_desc);
}
struct __tgt_offload_entry __offload_entries[2];
struct __tgt_offload_entry *__start_omp_offloading_entries = &__offload_entries[0];
struct __tgt_offload_entry *__stop_omp_offloading_entries = 0;

void  __attribute__((constructor)) register_kernel_entries()
{
  void *OUT__1__9009__main__13__entry_ptr__ = (void *)9009;
  struct __tgt_offload_entry OUT__1__9009__main__13__omp_offload_entry__ = {OUT__1__9009__main__13__entry_ptr__, "OUT__1__9009__main__13__kernel__", 0, 0, 0};
  __offload_entries[0] = OUT__1__9009__main__13__omp_offload_entry__;
  void *OUT__2__9009__main__7__entry_ptr__ = (void *)9010;
  struct __tgt_offload_entry OUT__2__9009__main__7__omp_offload_entry__ = {OUT__2__9009__main__7__entry_ptr__, "OUT__2__9009__main__7__kernel__", 0, 0, 0};
  __offload_entries[1] = OUT__2__9009__main__7__omp_offload_entry__;
  __stop_omp_offloading_entries = &__offload_entries[2];
  char cuda_entry_name[] = "rex_lib_target.cubin";
  __cubin_desc = register_cubin(cuda_entry_name,__start_omp_offloading_entries,__stop_omp_offloading_entries);
}
#include <stdio.h>
#include <stdlib.h>

int main(int argc,char **argv)
{
  int status = 0;
  int i;
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)9010;
    void *__args_base[] = {};
    void *__args[] = {};
    int64_t __arg_sizes[] = {};
    int64_t __arg_types[] = {};
    int32_t __arg_num = 0;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)9009;
    void *__args_base[] = {};
    void *__args[] = {};
    int64_t __arg_sizes[] = {};
    int64_t __arg_types[] = {};
    int32_t __arg_num = 0;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
  return 0;
}
