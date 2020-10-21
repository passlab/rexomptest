/*
1. how to include header
2. parallel region
3. runtime routine
4. undeterminated execution order
5. control number of threads
By C. Liao
*/
#include <stdio.h>
#ifdef _OPENMP
#include <omp.h>
#endif
#include "libxomp.h" 

struct OUT__1__9501___data 
{
  void *i_p;
}
;
static void OUT__1__9501__(void *__out_argv);

int main(int argc,char **argv)
{
  int status = 0;
  XOMP_init(argc,argv);
  int i = 0;
  struct OUT__1__9501___data __out_argv1__9501__;
  __out_argv1__9501__ . i_p = ((void *)(&i));
  XOMP_parallel_start(OUT__1__9501__,&__out_argv1__9501__,1,0,"/home/awang15/Projects/rexdev/rex_src/tests/nonsmoke/functional/CompileTests/OpenMP_tests/empty.c",20);
  XOMP_parallel_end("/home/awang15/Projects/rexdev/rex_src/tests/nonsmoke/functional/CompileTests/OpenMP_tests/empty.c",26);
  XOMP_terminate(status);
  return 0;
}

static void OUT__1__9501__(void *__out_argv)
{
  int *i = (int *)(((struct OUT__1__9501___data *)__out_argv) -> i_p);
#ifdef _OPENMP
   *i = omp_get_thread_num();
#endif
  printf("Hello,world! I am thread %d\n", *i);
}
