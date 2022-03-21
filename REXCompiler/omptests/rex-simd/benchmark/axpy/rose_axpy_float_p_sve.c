#include "rex_kmp.h" 
//axpy.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#define N_RUNS 20
#define N 102400000
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//Create a matrix and a vector and fill with random numbers

void init(float *X,float *Y)
{
  for (size_t i = 0; i < 102400000; i++) {
    X[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
    Y[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.
extern void OUT__1__3684__axpy__29__(int *__global_tid,int *__bound_tid,float **Xp__,float **Yp__,float *ap__);

void axpy(float *X,float *Y,float a)
{
  size_t i = 0;
  void *__out_argv1__3684__[3];
  __out_argv1__3684__[0] = ((void *)(&a));
  __out_argv1__3684__[1] = ((void *)(&Y));
  __out_argv1__3684__[2] = ((void *)(&X));
  __kmpc_fork_call(0,3,OUT__1__3684__axpy__29__,&X,&Y,&a);
}
// Debug functions

void axpy_serial(float *X,float *Y,float a)
{
  for (size_t i = 0; i < 102400000; i++) {
    Y[i] += a * X[i];
  }
}

float check(float *A,float *B)
{
  float difference = 0;
  for (size_t i = 0; i < 102400000; i++) {
    difference += A[i] - B[i];
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  float *X = (malloc(sizeof(float ) * 102400000));
  float *Y = (malloc(sizeof(float ) * 102400000));
  float *Y_serial = (malloc(sizeof(float ) * 102400000));
  float a = 3.14;
  srand((time(((void *)0))));
  init(X,Y);
  for (int i = 0; i < 102400000; i++) 
    Y_serial[i] = Y[i];
//warming up
  axpy(X,Y,a);
  axpy_serial(X,Y_serial,a);
  init(X,Y);
  for (int i = 0; i < 102400000; i++) 
    Y_serial[i] = Y[i];
  double t = 0;
  double start = read_timer();
  for (int i = 0; i < 20; i++) {
    fprintf(stderr,"%d ",i);
    axpy(X,Y,a);
    fprintf(stderr,"(%f,%f,%f)",Y[0],Y[102400000 - 10],Y[102400000 / 10]);
  }
  fprintf(stderr,"\n");
  t += read_timer() - start;
  double t_serial = 0;
  double start_serial = read_timer();
  for (int i = 0; i < 20; i++) 
    axpy_serial(X,Y_serial,a);
  t_serial += read_timer() - start_serial;
  double gflops = 2.0 * 102400000 * 102400000 * 20 / (1.0e9 * t);
  double gflops_serial = 2.0 * 102400000 * 102400000 * 20 / (1.0e9 * t_serial);
/*printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("AXPY (SIMD):\t\t%4f\t%4f\n", t/N_RUNS, gflops);
    printf("AXPY (Serial):\t\t%4f\t%4f\n", t_serial/N_RUNS, gflops_serial);
    printf("Correctness check: %f\n", check(Y,Y_serial));*/
  printf("%4f,%f\n",t / 20,(check(Y,Y_serial)));
  free(X);
  free(Y);
  free(Y_serial);
  return 0;
}
