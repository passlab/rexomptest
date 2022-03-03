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
#include <immintrin.h> 
#define N 1024
//#define N 16
// read timer in second
#include "rex_kmp.h" 
double read_timer();
void init(float **);
void matmul_simd(float **,float **,float **);
void matmul_serial(float **,float **,float **);
float check(float **,float **);
// Main
int main(int ,char *[]);

void OUT__1__3684__matmul_simd__36__(int *__global_tid,int *__bound_tid,float ***Ap__,float ***Bp__,float ***Cp__,float *tempp__)
{
  float ***A = (float ***)Ap__;
  float ***B = (float ***)Bp__;
  float ***C = (float ***)Cp__;
  float *temp = (float *)tempp__;
  int _p_i;
  int _p_j;
  int _p_k;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 1023;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_matmul_simd_36_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_matmul_simd_36_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ > 1023) 
    __upper_ = 1023;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
    for (_p_j = 0; _p_j < 1024; _p_j++) {
      //typedef int __m256;
      //typedef int __m512;
       *temp = ((float )0);
      __m512 __part0 = _mm512_setzero_ps();
      for (_p_k = 0; _p_k <= 1023; _p_k += 16) {
        float *__ptr1 = ( *A)[__index_];
        __m512 __vec2 = _mm512_loadu_ps(&__ptr1[_p_k]);
        float *__ptr3 = ( *B)[_p_j];
        __m512 __vec4 = _mm512_loadu_ps(&__ptr3[_p_k]);
        __m512 __vec5 = _mm512_mul_ps(__vec4,__vec2);
        __m512 __vec6 = _mm512_add_ps(__vec5,__part0);
        __part0 = (__vec6);
      }
      __m256 __buf0 = _mm512_extractf32x8_ps(__part0,0);
      __m256 __buf1 = _mm512_extractf32x8_ps(__part0,1);
      __buf1 = _mm256_add_ps(__buf0,__buf1);
      __buf1 = _mm256_hadd_ps(__buf1,__buf1);
      __buf1 = _mm256_hadd_ps(__buf1,__buf1);
      float __buf2[8];
      _mm256_storeu_ps(&__buf2,__buf1);
       *temp = __buf2[0] + __buf2[6];
      ( *C)[__index_][_p_j] =  *temp;
    }
  }
  __kmpc_for_static_fini(0,__global_tid_matmul_simd_36_0);
  __kmpc_barrier(0,__global_tid_matmul_simd_36_0);
}
