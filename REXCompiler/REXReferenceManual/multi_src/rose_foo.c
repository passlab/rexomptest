#include "rex_kmp.h" 
//struct __tgt_bin_desc *__cubin_desc = 0;

static char OUT__2__9009__main__7__id__ = 0;
struct __tgt_offload_entry OUT__2__9009__main__7__omp_offload_entry__ __attribute__((section ("omp_offloading_entries"))) = {&OUT__2__9009__main__7__id__, "OUT__2__9009__main__7__kernel__", 0, 0, 0};

#include <stdio.h>
#include <stdlib.h>

void foo()
{
  int i;
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)&OUT__2__9009__main__7__id__;
    void *__args_base[] = {};
    void *__args[] = {};
    int64_t __arg_sizes[] = {};
    int64_t __arg_types[] = {};
    int32_t __arg_num = 0;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
}
