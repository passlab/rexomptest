//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#define N_RUNS 20
#define N 10240000
// read timer in second
#include "rex_kmp.h" 
double read_timer();
//Create a matrix and a vector and fill with random numbers
void init(float *);
//Our sum function- what it does is pretty straight-forward.
float sum(float *);
// Debug functions
float sum_serial(float *);
int main(int ,char **);

void OUT__1__3684__sum__29__(int *__global_tid,int *__bound_tid,float **Xp__,float *resultp__)
{
  float **X = (float **)Xp__;
  float *result = (float *)resultp__;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 10239999;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_sum_29_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_sum_29_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ > 10239999) 
    __upper_ = 10239999;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
     *result += ( *X)[__index_];
  }
  __kmpc_for_static_fini(0,__global_tid_sum_29_0);
  __kmpc_barrier(0,__global_tid_sum_29_0);
}
