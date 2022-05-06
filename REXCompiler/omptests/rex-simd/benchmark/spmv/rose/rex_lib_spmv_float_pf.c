////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
#define REAL float
#include "rex_kmp.h" 
#include <arm_sve.h> 
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

void OUT__1__9202__main__76__(int *__global_tid,int *__bound_tid)
{
{
    int _p_row;
    int __index_;
    int __lower_ = 0;
    int __upper_ = nrows - 1;
    int __stride_ = 1;
    int __last_iter_ = 0;
    int __global_tid_OUT__1__9202__main__76___0_0 = __kmpc_global_thread_num(0);
    __kmpc_for_static_init_4(0,__global_tid_OUT__1__9202__main__76___0_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
    if (__upper_ > nrows - 1) 
      __upper_ = nrows - 1;
    for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
      float sum = (float )0.0;
      svbool_t __pg0 = svwhilelt_b32((unsigned long )0,ia[row + 1] - 1);
      svfloat32_t __part0 = svdup_f32(0.00000L);
      __pg0 = svptrue_b32();
      sum += svaddv(__pg0,__part0);
      y[__index_] = sum;
    }
    __kmpc_for_static_fini(0,__global_tid_OUT__1__9202__main__76___0_0);
    __kmpc_barrier(0,__global_tid_OUT__1__9202__main__76___0_0);
  }
}
