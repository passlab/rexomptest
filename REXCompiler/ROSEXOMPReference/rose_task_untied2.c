/*
 * the task-generation loop is put into a untied task
 * So when the thread running task-generation loop get preempted to
 * conduct the generated tasks,
 * the other threads can resume the task-generation task, which
 * is not tied to the original thread.
 */
#include <stdio.h>
#include <omp.h>
#define LARGE_NUMBER 1000
//#define LARGE_NUMBER 10000000
#include "libxomp.h" 
double item[1000];

void process(double input,int *j)
{
  printf("processing %f by thread %d\n",input,(omp_get_thread_num()));
}

struct OUT__1__10171___data 
{
  int i;
  void *j_p;
}
;
static void OUT__1__10171__(void *__out_argv);

struct OUT__2__10171___data 
{
  int i;
}
;
static void OUT__2__10171__(void *__out_argv);
static void OUT__3__10171__(void *__out_argv);

int main(argc,argv)
int argc;
char **argv;
{
  int status = 0;
  XOMP_init(argc,argv);
  XOMP_parallel_start(OUT__3__10171__,0,1,0,"/home/awang15/Projects/rexdev/rex_src/tests/nonsmoke/functional/CompileTests/OpenMP_tests/task_untied2.c",21);
  XOMP_parallel_end("/home/awang15/Projects/rexdev/rex_src/tests/nonsmoke/functional/CompileTests/OpenMP_tests/task_untied2.c",52);
  XOMP_terminate(status);
  return 0;
}

static void OUT__1__10171__(void *__out_argv)
{
  int i = (int )(((struct OUT__1__10171___data *)__out_argv) -> i);
  int *j = (int *)(((struct OUT__1__10171___data *)__out_argv) -> j_p);
  int _p_i = i;
  process(item[_p_i],&( *j));
}

static void OUT__2__10171__(void *__out_argv)
{
  int i = (int )(((struct OUT__2__10171___data *)__out_argv) -> i);
  int _p_i = i;
  int j = 100;
// i is firstprivate, item is shared
{
    for (_p_i = 0; _p_i < 1000; _p_i++) {
      struct OUT__1__10171___data __out_argv1__10171__;
      __out_argv1__10171__ . j_p = ((void *)(&j));
      __out_argv1__10171__ . i = _p_i;
      XOMP_task(OUT__1__10171__,&__out_argv1__10171__,0,sizeof(struct OUT__1__10171___data ),4,1,0);
    }
  }
}

static void OUT__3__10171__(void *__out_argv)
{
  if (XOMP_single()) {
    int i;
    printf("Using %d threads.\n",(omp_get_num_threads()));
    struct OUT__2__10171___data __out_argv2__10171__;
    __out_argv2__10171__ . i = i;
/*
         untied cannot be used with omp single
         So another level of task is needed to used untied here!!
         Explicit tasks: 
       * generated by #omp task
       * tied or untied
       Implicit tasks: 
       * generated by #omp parallel
       * always tied!!
       */
    XOMP_task(OUT__2__10171__,&__out_argv2__10171__,0,sizeof(struct OUT__2__10171___data ),4,1,1);
  }
  XOMP_barrier();
}
