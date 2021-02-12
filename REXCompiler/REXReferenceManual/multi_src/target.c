#include <stdio.h>
#include <stdlib.h>

extern void foo();

int main(int argc, char** argv) {
    int i;

    foo(); // call the followed code block in rose_foo.c
/*
{
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 256;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)OUT__2__9009__main__7__id__;
    void *__args_base[] = {};
    void *__args[] = {};
    int64_t __arg_sizes[] = {};
    int64_t __arg_types[] = {};
    int32_t __arg_num = 0;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
*/

#pragma omp target
#pragma omp parallel for
    for (i = 0; i < 6; i++) {
        printf("Test 2.\n");
    }

    return 0;
}
