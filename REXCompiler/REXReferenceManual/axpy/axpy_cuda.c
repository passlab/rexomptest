// Experimental test input for Accelerator directives
//  simplest scalar*vector operations
// Liao 1/15/2013
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <sys/timeb.h>
#include "axpy.h"

#define NUM_RUNS 10
double kernel_time = 0;

double read_timer_ms() {
    struct timeb tm;
    ftime(&tm);
    return (double) tm.time * 1000.0 + (double) tm.millitm;
}

/* change this to do saxpy or daxpy : single precision or double precision*/
#define REAL double
#define VEC_LEN 1024000 //use a fixed number for now
/* zero out the entire vector */
void zero(REAL *A, int n)
{
    int i;
    for (i = 0; i < n; i++) {
        A[i] = 0.0;
    }
}

/* initialize a vector with random floating point numbers */
void init(REAL *A, int n)
{
    int i;
    for (i = 0; i < n; i++) {
        A[i] = (double)drand48();
    }
}

/*serial version */
void axpy(REAL* x, REAL* y, long n, REAL a) {
  int i;
  for (i = 0; i < n; ++i)
  {
    y[i] += a * x[i];
  }
}

/* compare two arrays and return percentage of difference */
REAL check(REAL*A, REAL*B, int n)
{
    int i;
    REAL diffsum =0.0, sum = 0.0;
    for (i = 0; i < n; i++) {
        diffsum += fabs(A[i] - B[i]);
        sum += fabs(B[i]);
    }
    return diffsum/sum;
}

int main(int argc, char *argv[])
{
  int n;
  REAL *y_cuda, *y, *x;
  REAL a = 123.456;

  n = 1 << 23; // 2^23, 8 million
  fprintf(stderr, "Usage: axpy <n>, where the problem size is 2^n.\n");
  if (argc >= 2) {
    n = 1 << atoi(argv[1]);
  }
  y_cuda = (REAL *) malloc(n * sizeof(REAL));
  y  = (REAL *) malloc(n * sizeof(REAL));
  x = (REAL *) malloc(n * sizeof(REAL));

  srand48(1<<12);
  init(x, n);
  init(y_cuda, n);
  memcpy(y, y_cuda, n*sizeof(REAL));

  axpy(x, y, n, a);

  int i;
  int num_runs = 10;
  /* cuda version */
  double elapsed = read_timer_ms();
  for (i = 0; i < NUM_RUNS; i++)
      axpy_cuda(x, y, n, a);
  elapsed = (read_timer_ms() - elapsed)/num_runs;

  REAL checkresult = check(y_cuda, y, n);
  fprintf(stderr, "axpy(%d): checksum: %g, time: %0.2fms\n", n, checkresult, elapsed);
  //assert (checkresult < 1.0e-10);

  printf("%g", kernel_time);

  free(y_cuda);
  free(y);
  free(x);
  return 0;
}
