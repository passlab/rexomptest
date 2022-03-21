#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <math.h>
#include <arm_sve.h>
#define N_RUNS 20
#define N 10240
// read timer in second
#include "rex_kmp.h" 
double read_timer();
//Create a matrix and a vector and fill with random numbers
void init(float *,float *);
void matvec_simd(float *,float *,float *);
// Debug functions
void matvec_serial(float *,float *,float *);
float check(float *,float *);
int main(int ,char **);

void OUT__1__3684__matvec_simd__31__(int *__global_tid,int *__bound_tid,float **matrixp__,float **vectorp__,float **destp__)
{
  float **matrix = (float **)matrixp__;
  float **vector = (float **)vectorp__;
  float **dest = (float **)destp__;
  size_t _p_i;
  size_t _p_j;
  int __index_;
  int __lower_ = (size_t )0;
  int __upper_ = ((unsigned long )10240) - 1;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_matvec_simd_31_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_matvec_simd_31_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ > ((unsigned long )10240) - 1) 
    __upper_ = ((unsigned long )10240) - 1;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
    float tmp = (float )0;
    svbool_t __pg0 = svwhilelt_b32_u64(0,((unsigned long )10240) - 1);
    for (_p_j = ((size_t )0); _p_j <= ((unsigned long )10240) - 1; _p_j += svcntw()) {
      //typedef int svfloat32_t;
     // typedef int svbool_t;
      svfloat32_t __vec0 = svld1(__pg0,&( *matrix)[__index_ * ((unsigned long )10240) + _p_j]);
      svfloat32_t __vec1 = svld1(__pg0,&( *vector)[_p_j]);
      svfloat32_t __vec2 = svmul_f32_m(__pg0,__vec1,__vec0);
      tmp += svaddv(__pg0,__vec2);
      __pg0 = svwhilelt_b32_u64(_p_j,((unsigned long )10240) - 1);
    }
    ( *dest)[__index_] = tmp;
  }
  __kmpc_for_static_fini(0,__global_tid_matvec_simd_31_0);
  __kmpc_barrier(0,__global_tid_matvec_simd_31_0);
}
