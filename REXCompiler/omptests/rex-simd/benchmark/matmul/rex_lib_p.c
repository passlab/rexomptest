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

void OUT__1__3684__matmul_simd__36__(int *__global_tid,int *__bound_tid,float ***Ap__,float ***Bp__,float ***Cp__,int *ip__,float *tempp__)
{
  float ***A = (float ***)Ap__;
  float ***B = (float ***)Bp__;
  float ***C = (float ***)Cp__;
  int *i = (int *)ip__;
  float *temp = (float *)tempp__;
  int _p_j;
  int _p_k;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 1023;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_matmul_simd_37_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_matmul_simd_37_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ > 1023) 
    __upper_ = 1023;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
     *temp = ((float )0);
    for (_p_k = 0; _p_k < 1024; _p_k++) {
       *temp += ( *A)[ *i][_p_k] * ( *B)[__index_][_p_k];
    }
    ( *C)[ *i][__index_] =  *temp;
  }
  __kmpc_for_static_fini(0,__global_tid_matmul_simd_37_0);
  __kmpc_barrier(0,__global_tid_matmul_simd_37_0);
}
