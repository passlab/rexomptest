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
double read_timer();
//Create a matrix and a vector and fill with random numbers
void init(float *,float *);
void matvec_simd(float *,float *,float *);
// Debug functions
void matvec_serial(float *,float *,float *);
float check(float *,float *);
int main(int ,char **);

void OUT__1__3684__matvec_simd__30__(int *__global_tid,int *__bound_tid,float **matrixp__,float **vectorp__,float **destp__)
{
  float **matrix = (float **)matrixp__;
  float **vector = (float **)vectorp__;
  float **dest = (float **)destp__;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 10239;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_matvec_simd_30_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_matvec_simd_30_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ > 10239) 
    __upper_ = 10239;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
    float tmp = (float )0;
    for (int j = 0; j < 10240; j++) {
      tmp += ( *matrix)[__index_ * 10240 + j] * ( *vector)[j];
    }
    ( *dest)[__index_] = tmp;
  }
  __kmpc_for_static_fini(0,__global_tid_matvec_simd_30_0);
  __kmpc_barrier(0,__global_tid_matvec_simd_30_0);
}
