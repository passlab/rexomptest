#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include "rex_kmp.h" 
int main(int ,char **);

void OUT__1__9547__main__27__(int *__global_tid,int *__bound_tid)
{
  int _p_i;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 19;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_main_27_0 = __kmpc_global_thread_num(0);
  __kmpc_dispatch_init_4(0,__global_tid_main_27_0,1073741861,__lower_,__upper_,__stride_,1);
{
    while(__lower_ <= __upper_){
      if (__upper_ > 19) 
        __upper_ = 19;
      for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
        printf("Test Runtime - thread:%d, iter: %d.\n",(omp_get_thread_num()),__index_);
      }
      __lower_ += __stride_;
      __upper_ += __stride_;
    }
  }
  __kmpc_for_static_fini(0,__global_tid_main_27_0);
  __kmpc_barrier(0,__global_tid_main_27_0);
}

void OUT__2__9547__main__22__(int *__global_tid,int *__bound_tid)
{
  int _p_i;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 19;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_main_22_2 = __kmpc_global_thread_num(0);
  __kmpc_dispatch_init_4(0,__global_tid_main_22_2,1073741862,__lower_,__upper_,__stride_,1);
{
    while(__lower_ <= __upper_){
      if (__upper_ > 19) 
        __upper_ = 19;
      for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
        printf("Test Auto - thread:%d, iter: %d.\n",(omp_get_thread_num()),__index_);
      }
      __lower_ += __stride_;
      __upper_ += __stride_;
    }
  }
  __kmpc_for_static_fini(0,__global_tid_main_22_2);
  __kmpc_barrier(0,__global_tid_main_22_2);
}

void OUT__3__9547__main__17__(int *__global_tid,int *__bound_tid)
{
  int _p_i;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 19;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_main_17_4 = __kmpc_global_thread_num(0);
  __kmpc_dispatch_init_4(0,__global_tid_main_17_4,1073741860,__lower_,__upper_,__stride_,2);
{
    while(__lower_ <= __upper_){
      if (__upper_ > 19) 
        __upper_ = 19;
      for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
        printf("Test Guided - thread:%d, iter: %d.\n",(omp_get_thread_num()),__index_);
      }
      __lower_ += __stride_;
      __upper_ += __stride_;
    }
  }
  __kmpc_for_static_fini(0,__global_tid_main_17_4);
  __kmpc_barrier(0,__global_tid_main_17_4);
}

void OUT__4__9547__main__12__(int *__global_tid,int *__bound_tid)
{
  int _p_i;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 19;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_main_12_6 = __kmpc_global_thread_num(0);
  __kmpc_dispatch_init_4(0,__global_tid_main_12_6,1073741859,__lower_,__upper_,__stride_,2);
{
    while(__kmpc_dispatch_next_4(0,__global_tid_main_12_6,&__last_iter_,&__lower_,&__upper_,&__stride_)){
      if (__upper_ > 19) 
        __upper_ = 19;
      for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
        printf("Test Dynamic - thread:%d, iter: %d.\n",(omp_get_thread_num()),__index_);
      }
    }
  }
  __kmpc_barrier(0,__global_tid_main_12_6);
}

void OUT__5__9547__main__7__(int *__global_tid,int *__bound_tid)
{
  int _p_i;
  int __index_;
  int __lower_ = 0;
  int __upper_ = 19;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_main_7_8 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_main_7_8,536870945,&__last_iter_,&__lower_,&__upper_,&__stride_,1,2);
{
    while(__lower_ <= __upper_){
      if (__upper_ > 19) 
        __upper_ = 19;
      for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
        printf("Test Static - thread:%d, iter: %d.\n",(omp_get_thread_num()),__index_);
      }
      __lower_ += __stride_;
      __upper_ += __stride_;
    }
  }
  __kmpc_for_static_fini(0,__global_tid_main_7_8);
  __kmpc_barrier(0,__global_tid_main_7_8);
}
