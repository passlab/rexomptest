#include "rex_kmp.h" 
char OUT__3__9500__axpy_ompacc__67__id__ = 0;
struct __tgt_offload_entry OUT__3__9500__axpy_ompacc__67__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__3__9500__axpy_ompacc__67__id__)), "OUT__3__9500__axpy_ompacc__67__kernel__", 0, 0, 0};
char OUT__2__9500__axpy_ompacc__70__id__ = 0;
struct __tgt_offload_entry OUT__2__9500__axpy_ompacc__70__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__2__9500__axpy_ompacc__70__id__)), "OUT__2__9500__axpy_ompacc__70__kernel__", 0, 0, 0};
char OUT__1__9500__axpy_ompacc__75__id__ = 0;
struct __tgt_offload_entry OUT__1__9500__axpy_ompacc__75__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__1__9500__axpy_ompacc__75__id__)), "OUT__1__9500__axpy_ompacc__75__kernel__", 0, 0, 0};
// Experimental test input for Accelerator directives
//  simplest scalar*vector operations
// Liao 1/15/2013
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <sys/timeb.h>
#define NUM_RUNS 10

double read_timer_ms()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) * 1000.0 + ((double )tm . millitm);
}
/* change this to do saxpy or daxpy : single precision or double precision*/
#define REAL double
#define VEC_LEN 1024000 //use a fixed number for now
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
/*serial version */

void axpy(double *x,double *y,long n,double a)
{
  int i;
  for (i = 0; i < n; i++) {
    y[i] += a * x[i];
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

void axpy_ompacc(double *x,double *y,int n,double a)
{
  int i;
/* //implementation of the following omp target region
#pragma omp target teams distribute parallel for device (0) map(tofrom: y[0:n]) map(to: x[0:n],a,n) shared(x, y, n, a) private(i)
  for (i = 0; i < n; ++i)
    y[i] += a * x[i];
*/
  double *_dev_x;
  int _dev_x_size[1] = {n};
  int _dev_x_offset[1] = {0};
  int _dev_x_Dim[1] = {n};
  double *_dev_y;
  int _dev_y_size[1] = {n};
  int _dev_y_offset[1] = {0};
  int _dev_y_Dim[1] = {n};
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1;
    int _num_blocks_ = 1;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)(&OUT__3__9500__axpy_ompacc__67__id__);
    void *__args_base[] = {&n, &a, &i, x, y};
    void *__args[] = {&n, &a, &i, x + 0, y + 0};
    int64_t __arg_sizes[] = {((int64_t )(sizeof(int ))), ((int64_t )(sizeof(double ))), ((int64_t )(sizeof(int ))), ((int64_t )(sizeof(double ) * n)), ((int64_t )(sizeof(double ) * n))};
    int64_t __arg_types[] = {33, 33, 33, 32, 35};
    int32_t __arg_num = 5;
    __tgt_target_teams(OUT__3__9500__axpy_ompacc__67__id__,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_threads_per_block_,_num_blocks_);
  }
}

int main(int argc,char *argv[])
{
  int status = 0;
  int n;
  double *y_ompacc;
  double *y;
  double *x;
  double a = 123.456;
  n = 1 << 23;
// 2^23, 8 million
  fprintf(stderr,"Usage: axpy <n>, where the problem size is 2^n.\n");
  if (argc >= 2) {
    n = 1 << atoi(argv[1]);
  }
  y_ompacc = ((double *)(malloc(n * sizeof(double ))));
  y = ((double *)(malloc(n * sizeof(double ))));
  x = ((double *)(malloc(n * sizeof(double ))));
  srand48((1 << 12));
  init(x,n);
  init(y_ompacc,n);
  memcpy(y,y_ompacc,n * sizeof(double ));
  axpy(x,y,n,a);
  int i;
  double elapsed = read_timer_ms();
  for (i = 0; i < 10; i++) 
    axpy_ompacc(x,y,n,a);
  elapsed = (read_timer_ms() - elapsed) / 10;
  double checkresult = check(y_ompacc,y,n);
  fprintf(stderr,"axpy(%d): checksum: %g, time: %0.2fms\n",n,checkresult,elapsed);
//assert (checkresult < 1.0e-10);
  printf("%g",elapsed);
  free(y_ompacc);
  free(y);
  free(x);
  return 0;
}
