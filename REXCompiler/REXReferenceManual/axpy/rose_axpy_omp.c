#include "rex_kmp.h" 
char OUT__1__7822__axpy_omp__49__id__ = 0;
struct __tgt_offload_entry OUT__1__7822__axpy_omp__49__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__1__7822__axpy_omp__49__id__)), "OUT__1__7822__axpy_omp__49__kernel__", 0, 0, 0};
// Experimental test input for Accelerator directives
//  simplest scalar*vector operations
// Liao 1/15/2013
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#define TEAM_NUM 1024
#define TEAM_SIZE 1024

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,(void *)0);
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
/* change this to do saxpy or daxpy : single precision or double precision*/
#define REAL double
#define VEC_LEN 1024000 // use a fixed number for now
/* zero out the entire vector */

void zero(double *A,int n)
{
  int i;
  for (i = 0; i < n; i++) {
    A[i] = 0.0;
  }
}
/* initialize a vector with random floating point numbers */

void init(double *A,int n)
{
  int i;
  for (i = 0; i < n; i++) {
    A[i] = ((double )(drand48()));
  }
}
/* serial version */

void axpy(double *x,double *y,long n,double a)
{
  for (int i = 0; i < n; ++i) {
    y[i] += a * x[i];
  }
}
/* omp version */

void axpy_omp(double *x,double *y,long n,double a)
{
  int i;
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1024;
    int _num_blocks_ = 1;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)(&OUT__1__7822__axpy_omp__49__id__);
    void *__args_base[] = {&n, &a, x, y};
    void *__args[] = {&n, &a, x + 0, y + 0};
    int64_t __arg_sizes[] = {((int64_t )(sizeof(long ))), ((int64_t )(sizeof(double ))), ((int64_t )(sizeof(double ) * n)), ((int64_t )(sizeof(double ) * n))};
    int64_t __arg_types[] = {33, 33, 33, 35};
    int32_t __arg_num = 4;
    __tgt_target_teams(__device_id,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_num_blocks_,_threads_per_block_);
  }
}
/* compare two arrays and return percentage of difference */

double check(double *A,double *B,int n)
{
  int i;
  double diffsum = 0.0;
  double sum = 0.0;
  for (i = 0; i < n; i++) {
    diffsum += fabs(A[i] - B[i]);
    sum += fabs(B[i]);
  }
  return diffsum / sum;
}

int main(int argc,char *argv[])
{
  int status = 0;
  int n;
  double *y_check;
  double *y;
  double *x;
  double a = 123.456;
  if (argc >= 2) {
    n = atoi(argv[1]);
  }
   else {
    n = 1024000;
    fprintf(stderr,"Usage: axpy <n>. By default n = %d\n",n);
  }
  ;
  y_check = ((double *)(malloc(n * sizeof(double ))));
  y = ((double *)(malloc(n * sizeof(double ))));
  x = ((double *)(malloc(n * sizeof(double ))));
  srand48((1 << 12));
  init(x,n);
  init(y,n);
  memcpy(y_check,y,n * sizeof(double ));
  int num_runs = 10;
  double elapsed = read_timer_ms();
  for (int i = 0; i < num_runs; i++) 
    axpy_omp(x,y,n,a);
  elapsed = (read_timer_ms() - elapsed) / num_runs;
  printf("axpy(%d): time: %0.2fms\n",n,elapsed);
  for (int i = 0; i < num_runs; i++) 
    axpy(x,y_check,n,a);
  double check_result = check(y,y_check,n);
  (((void )(sizeof(((check_result < 1.0e-10?1 : 0))))) , ((
{
    if (check_result < 1.0e-10) 
      ;
     else 
      __assert_fail("check_result < 1.0e-10","axpy_omp.c",100,__PRETTY_FUNCTION__);
  })));
  free(y_check);
  free(y);
  free(x);
  return 0;
}
