#include "rex_kmp.h" 
struct __tgt_bin_desc *__cubin_desc = 0;

void  __attribute__((destructor)) unregister_kernel_entries()
{
  __tgt_unregister_lib(__cubin_desc);
}
char OUT__1__8060__main__15__id__[] = "OUT__1__8060__main__15__";
struct __tgt_offload_entry __offload_entries[1];
struct __tgt_offload_entry *__start_omp_offloading_entries = &__offload_entries[0];
struct __tgt_offload_entry *__stop_omp_offloading_entries = 0;

void  __attribute__((constructor)) register_kernel_entries()
{
  void *OUT__1__8060__main__15__entry_ptr__ = (void *)OUT__1__8060__main__15__id__;
  struct __tgt_offload_entry OUT__1__8060__main__15__omp_offload_entry__ = {OUT__1__8060__main__15__entry_ptr__, "OUT__1__8060__main__15__kernel__", 0, 0, 0};
  __offload_entries[0] = OUT__1__8060__main__15__omp_offload_entry__;
  __stop_omp_offloading_entries = &__offload_entries[1];
  char cuda_entry_name[] = "rex_lib_target.cubin";
  __cubin_desc = register_cubin(cuda_entry_name,__start_omp_offloading_entries,__stop_omp_offloading_entries);
}
#include <stdio.h>
#include <stdlib.h>

int main(int argc,char **argv)
{
  int status = 0;
  int i;
  int a[3] = {(3), (4), (5)};
  int b = 4;
  int c = 6;
  int d = 8;
// 4, 6, 8
  printf("Test0 %d, %d, %d.\n",b,c,d);
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)OUT__1__8060__main__15__id__;
    void *__args_base[] = {&b, &c, &d};
    void *__args[] = {&b, &c, &d};
    int64_t __arg_sizes[] = {((int64_t )(sizeof(int ))), ((int64_t )(sizeof(int ))), ((int64_t )(sizeof(int )))};
    int64_t __arg_types[] = {33, 34, 35};
    int32_t __arg_num = 3;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
// 4, 60, 80
  printf("Test3 %d, %d, %d.\n",b,c,d);
  return 0;
}
