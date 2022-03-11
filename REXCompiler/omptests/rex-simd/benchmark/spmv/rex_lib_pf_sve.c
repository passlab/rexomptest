////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
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
    float sum = (float )0.0;
    svbool_t __pg0 = svwhilelt_b32(0,( *ia)[__index_ + 1] - 1);
    for (_p_idx = ( *ia)[__index_]; _p_idx <= ( *ia)[__index_ + 1] - 1; _p_idx += svcntw()) {
      typedef int svint32_t;
      typedef int svfloat32_t;
      typedef int svbool_t;
      svfloat32_t __vec0 = svld1(__pg0,&( *a)[_p_idx]);
      svint32_t __vindex0 = svld1(__pg0,&( *ja)[_p_idx]);
      svfloat32_t __vec1 = svld1_gather_index(__pg0, *x,__vindex0);
      svfloat32_t __vec2 = svmul_f32_m(__pg0,__vec1,__vec0);
      sum += svaddv(__pg0,__vec2);
      __pg0 = svwhilelt_b32(_p_idx,( *ia)[__index_ + 1] - 1);
    }
    ( *y)[__index_] = sum;
  }
  __kmpc_for_static_fini(0,__global_tid_main_76_0);
  __kmpc_barrier(0,__global_tid_main_76_0);
}
