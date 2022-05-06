#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <math.h>
#define N_RUNS 20
#define N 10240
// read timer in second
#include "rex_kmp.h" 
#include <arm_sve.h> 
double read_timer();
//Create a matrix and a vector and fill with random numbers
void init(float *,float *);
void matvec_simd(float *,float *,float *);
// Debug functions
void matvec_serial(float *,float *,float *);
float check(float *,float *);
int main(int ,char **);

void OUT__1__9574__matvec_simd__31__(int *__global_tid,int *__bound_tid)
{
{
    size_t _p_i;
    int __index_;
    int __lower_ = (size_t )0;
    int __upper_ = ((unsigned long )10240) - 1;
    int __stride_ = 1;
    int __last_iter_ = 0;
    int __global_tid_OUT__1__9574__matvec_simd__31___0_0 = __kmpc_global_thread_num(0);
    __kmpc_for_static_init_4(0,__global_tid_OUT__1__9574__matvec_simd__31___0_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
    if (__upper_ > ((unsigned long )10240) - 1) 
      __upper_ = ((unsigned long )10240) - 1;
    for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
      float tmp = (float )0;
      svbool_t __pg0 = svwhilelt_b32((unsigned long )0,((unsigned long )10240) - 1);
      svfloat32_t __part0 = svdup_f32(0.00000L);
      __pg0 = svptrue_b32();
      tmp += svaddv(__pg0,__part0);
      dest[__index_] = tmp;
    }
    __kmpc_for_static_fini(0,__global_tid_OUT__1__9574__matvec_simd__31___0_0);
    __kmpc_barrier(0,__global_tid_OUT__1__9574__matvec_simd__31___0_0);
  }
}
