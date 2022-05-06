/*
 * Square matrix multiplication
 * A[N][N] * B[N][N] = C[N][N]
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#define N 1024
//#define N 16
// read timer in second
#include "rex_kmp.h" 
#include <arm_sve.h> 
double read_timer();
void init(float **);
void matmul_simd(float **,float **,float **);
void matmul_serial(float **,float **,float **);
float check(float **,float **);
// Main
int main(int ,char *[]);

void OUT__1__9606__matmul_simd__34__(int *__global_tid,int *__bound_tid)
{
{
    size_t _p_i;
    size_t _p_j;
    int __index_;
    int __lower_ = (size_t )0;
    int __upper_ = ((unsigned long )1024) - 1;
    int __stride_ = 1;
    int __last_iter_ = 0;
    int __global_tid_OUT__1__9606__matmul_simd__34___0_0 = __kmpc_global_thread_num(0);
    __kmpc_for_static_init_4(0,__global_tid_OUT__1__9606__matmul_simd__34___0_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
    if (__upper_ > ((unsigned long )1024) - 1) 
      __upper_ = ((unsigned long )1024) - 1;
    for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
      for (_p_j = ((size_t )0); _p_j < ((unsigned long )1024); _p_j++) {
        float temp = (float )0;
        svbool_t __pg0 = svwhilelt_b32((unsigned long )0,((unsigned long )1024) - 1);
        svfloat32_t __part0 = svdup_f32(0.00000L);
        __pg0 = svptrue_b32();
        temp += svaddv(__pg0,__part0);
        C[__index_][_p_j] = temp;
      }
    }
    __kmpc_for_static_fini(0,__global_tid_OUT__1__9606__matmul_simd__34___0_0);
    __kmpc_barrier(0,__global_tid_OUT__1__9606__matmul_simd__34___0_0);
  }
}
