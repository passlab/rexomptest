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

void OUT__1__8874__sum__30__(int *__global_tid,int *__bound_tid)
{
{
    size_t _p_i;
    int __index_;
    int __lower_ = (size_t )0;
    int __upper_ = ((unsigned long )10240000) - 1;
    int __stride_ = 1;
    int __last_iter_ = 0;
    int __global_tid_OUT__1__8874__sum__30___0_0 = __kmpc_global_thread_num(0);
    __kmpc_for_static_init_4(0,__global_tid_OUT__1__8874__sum__30___0_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
    if (__upper_ > ((unsigned long )10240000) - 1) 
      __upper_ = ((unsigned long )10240000) - 1;
    for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
      result += X[__index_];
    }
    __kmpc_for_static_fini(0,__global_tid_OUT__1__8874__sum__30___0_0);
    __kmpc_barrier(0,__global_tid_OUT__1__8874__sum__30___0_0);
  }
}
