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
double read_timer();
void init(float **);
void matmul_simd(float **,float **,float **);
void matmul_serial(float **,float **,float **);
float check(float **,float **);
// Main
int main(int ,char *[]);

void OUT__1__3684__matmul_simd__35__(int *__global_tid,int *__bound_tid,float ***Ap__,float ***Bp__,float ***Cp__,float *tempp__)
{
  float ***A = (float ***)Ap__;
  float ***B = (float ***)Bp__;
  float ***C = (float ***)Cp__;
  float *temp = (float *)tempp__;
  size_t _p_i;
  size_t _p_j;
  size_t _p_k;
  int __index_;
  int __lower_ = (size_t )0;
  int __upper_ = ((unsigned long )1024) - 1;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_matmul_simd_35_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_matmul_simd_35_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ > ((unsigned long )1024) - 1) 
    __upper_ = ((unsigned long )1024) - 1;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
    for (_p_j = ((size_t )0); _p_j < ((unsigned long )1024); _p_j++) {
       *temp = ((float )0);
      for (_p_k = ((size_t )0); _p_k < ((unsigned long )1024); _p_k++) {
         *temp += ( *A)[__index_][_p_k] * ( *B)[_p_j][_p_k];
      }
      ( *C)[__index_][_p_j] =  *temp;
    }
  }
  __kmpc_for_static_fini(0,__global_tid_matmul_simd_35_0);
  __kmpc_barrier(0,__global_tid_matmul_simd_35_0);
}
