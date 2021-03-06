/*
* Decremental loop iteration, 
* Default loop scheduling
*/
#include <stdio.h>
#ifdef _OPENMP
#include <omp.h>
#endif 
#include "rex_kmp.h" 
int a[20];

struct OUT__1__3482___data 
{
  void *j_p;
}
;
static void OUT__1__3482__(int *__global_tid,int *__bound_tid,void *__out_argv);

int main(int argc,char **argv)
{
  int status = 0;
  int i;
  int j = 100;
  struct OUT__1__3482___data __out_argv1__3482__;
  __out_argv1__3482__ . j_p = ((void *)(&j));
  __kmpc_fork_call(0,1,OUT__1__3482__,&__out_argv1__3482__);
  return 0;
}

static void OUT__1__3482__(int *__global_tid,int *__bound_tid,void *__out_argv)
{
  int *j = (int *)(((struct OUT__1__3482___data *)__out_argv) -> j_p);
  if (__kmpc_single(0, *__global_tid)) {
    printf("Using %d threads.\n",(omp_get_num_threads()));
    __kmpc_end_single(0, *__global_tid);
  }
  __kmpc_barrier(0, *__global_tid);
{
    int _p_i;
    int _p_j =  *j;
    int __index_;
    int __lower_ = 19;
    int __upper_ = 0;
    int __stride_ = -3;
    int __last_iter_ = 0;
    __kmpc_for_static_init_4(0, *__global_tid,34,&__last_iter_,&__lower_,&__upper_,&__stride_,-3,1);
    if (__upper_ < 0) 
      __upper_ = 0;
    for (__index_ = __lower_; __index_ >= __upper_; __index_ += -3) {
      a[__index_] = __index_ * 2 + _p_j;
      printf("Iteration %2d is carried out by thread %2d\n",__index_,(omp_get_thread_num()));
    }
    if (__index_ != __lower_ && __index_ < 0) 
       *j = _p_j;
    __kmpc_for_static_fini(0, *__global_tid);
  }
}
