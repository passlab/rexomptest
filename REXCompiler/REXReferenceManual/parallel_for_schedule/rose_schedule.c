#include "rex_kmp.h" 
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
extern void OUT__1__9547__main__27__(int *__global_tid,int *__bound_tid);
extern void OUT__2__9547__main__22__(int *__global_tid,int *__bound_tid);
extern void OUT__3__9547__main__17__(int *__global_tid,int *__bound_tid);
extern void OUT__4__9547__main__12__(int *__global_tid,int *__bound_tid);
extern void OUT__5__9547__main__7__(int *__global_tid,int *__bound_tid);

int main(int argc,char **argv)
{
  int status = 0;
  int i;
  int __global_tid_main_7_9 = __kmpc_global_thread_num(0);
  __kmpc_push_num_threads(0,__global_tid_main_7_9,4);
  __kmpc_fork_call(0,0,OUT__5__9547__main__7__,0);
  int __global_tid_main_12_7 = __kmpc_global_thread_num(0);
  __kmpc_push_num_threads(0,__global_tid_main_12_7,4);
  __kmpc_fork_call(0,0,OUT__4__9547__main__12__,0);
  int __global_tid_main_17_5 = __kmpc_global_thread_num(0);
  __kmpc_push_num_threads(0,__global_tid_main_17_5,4);
  __kmpc_fork_call(0,0,OUT__3__9547__main__17__,0);
  int __global_tid_main_22_3 = __kmpc_global_thread_num(0);
  __kmpc_push_num_threads(0,__global_tid_main_22_3,4);
  __kmpc_fork_call(0,0,OUT__2__9547__main__22__,0);
  int __global_tid_main_27_1 = __kmpc_global_thread_num(0);
  __kmpc_push_num_threads(0,__global_tid_main_27_1,4);
  __kmpc_fork_call(0,0,OUT__1__9547__main__27__,0);
  return 0;
}
