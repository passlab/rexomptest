#include "rex_kmp.h" 
char OUT__1__7978__main__26__id__ = 0;
struct __tgt_offload_entry OUT__1__7978__main__26__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__1__7978__main__26__id__)), "OUT__1__7978__main__26__kernel__", 0, 0, 0};
#include <stdio.h>
#include <stdlib.h>
extern void foo();

int main(int argc,char **argv)
{
  int status = 0;
  int i;
  foo();
// call the followed code block in rose_foo.c
/*
{
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)(&OUT__1__7655__foo__7__id__);
    void *__args_base[] = {};
    void *__args[] = {};
    int64_t __arg_sizes[] = {};
    int64_t __arg_types[] = {};
    int32_t __arg_num = 0;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
*/
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)(&OUT__1__7978__main__26__id__);
    void *__args_base[] = {};
    void *__args[] = {};
    int64_t __arg_sizes[] = {};
    int64_t __arg_types[] = {};
    int32_t __arg_num = 0;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
  return 0;
}
