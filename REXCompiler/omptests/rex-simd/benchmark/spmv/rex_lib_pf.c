////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
#include <immintrin.h> 
#define REAL float
#include "rex_kmp.h" 
double read_timer();
//#define DEFAULT_DIMSIZE 256
void print_array(char *,char *,float *,int ,int );
/*  subroutine error_check (n,m,alpha,dx,dy,u,f)
 implicit none
 ************************************************************
 * Checks error between numerical and exact solution
 *
 ************************************************************/
int main(int ,char *[]);

void OUT__1__3684__main__76__(int *__global_tid,int *__bound_tid,int **iap__,int **jap__,float **ap__,float **xp__,float **yp__,int *nrowsp__)
{
  int **ia = (int **)iap__;
  int **ja = (int **)jap__;
  float **a = (float **)ap__;
  float **x = (float **)xp__;
  float **y = (float **)yp__;
  int *nrows = (int *)nrowsp__;
  int _p_row;
  int _p_idx;
  int __index_;
  int __lower_ = 0;
  int __upper_ =  *nrows - 1;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_main_76_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_main_76_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ >  *nrows - 1) 
    __upper_ =  *nrows - 1;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
    /*typedef int __m256;
    typedef int __m512i;
    typedef int __m512;*/
    float sum = (float )0.0;
    __mmask16 __mask0;
    __mmask16 __mask1;
    __mmask16 __mask2 = _kxnor_mask16(__mask0,__mask1);
    __m512 __buf0 = _mm512_setzero_ps();
    __m512 __part0 = _mm512_setzero_ps();
    for (_p_idx = ( *ia)[__index_]; _p_idx <= ( *ia)[__index_ + 1] - 1; _p_idx += 16) {
      //typedef int __mmask16;
      __m512 __vec1 = _mm512_loadu_ps(&( *a)[_p_idx]);
      __m512i __vindex0 = _mm512_loadu_si512((__m512i *)(&( *ja)[_p_idx]));
      __m512 __vec2 = _mm512_mask_i32gather_ps(__buf0,__mask2,__vindex0, *x,4);
      __m512 __vec3 = _mm512_mul_ps(__vec2,__vec1);
      __m512 __vec4 = _mm512_add_ps(__vec3,__part0);
      __part0 = (__vec4);
    }
    __m256 __buf1 = _mm512_extractf32x8_ps(__part0,0);
    __m256 __buf2 = _mm512_extractf32x8_ps(__part0,1);
    __buf2 = _mm256_add_ps(__buf1,__buf2);
    __buf2 = _mm256_hadd_ps(__buf2,__buf2);
    __buf2 = _mm256_hadd_ps(__buf2,__buf2);
    float __buf3[8];
    _mm256_storeu_ps(&__buf3,__buf2);
    sum = __buf3[0] + __buf3[6];
    ( *y)[__index_] = sum;
  }
  __kmpc_for_static_fini(0,__global_tid_main_76_0);
  __kmpc_barrier(0,__global_tid_main_76_0);
}
