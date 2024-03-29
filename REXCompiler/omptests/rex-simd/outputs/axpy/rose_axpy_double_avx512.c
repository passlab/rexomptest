#include "rex_kmp.h" 
//axpy.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <immintrin.h> 
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

void init(double *X,double *Y)
{
  for (int i = 0; i < 102400000; i++) {
    X[i] = ((double )(rand())) / ((double )(2147483647 / 10.0));
    Y[i] = ((double )(rand())) / ((double )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

void axpy(double *X,double *Y,double a)
{
  int i;
  __m512d __vec1 = _mm512_set1_pd(a);
  for (i = 0; i <= 102399999; i += 8) {
    __m512d __vec0 = _mm512_loadu_pd(&Y[i]);
    __m512d __vec2 = _mm512_loadu_pd(&X[i]);
    __m512d __vec3 = _mm512_mul_pd(__vec2,__vec1);
    __m512d __vec4 = _mm512_add_pd(__vec3,__vec0);
    _mm512_storeu_pd(&Y[i],__vec4);
  }
}
// Debug functions

void axpy_serial(double *X,double *Y,double a)
{
  for (int i = 0; i < 102400000; i++) {
    Y[i] += a * X[i];
  }
}

void print_vector(double *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%.2f ",vector[i]);
  }
  puts("]");
}

double check(double *A,double *B)
{
  double difference = 0;
  for (int i = 0; i < 102400000; i++) {
    difference += A[i] - B[i];
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  double *X = (malloc(sizeof(double ) * 102400000));
  double *Y = (malloc(sizeof(double ) * 102400000));
  double *Y_serial = (malloc(sizeof(double ) * 102400000));
  double a = 3.14;
  srand((time(((void *)0))));
  init(X,Y);
  for (int i = 0; i < 102400000; i++) 
    Y_serial[i] = Y[i];
  print_vector(Y);
  print_vector(X);
  printf("%.2f\n",a);
  puts("=\n");
//warming up
  axpy(X,Y,a);
  axpy_serial(X,Y_serial,a);
  init(X,Y);
  for (int i = 0; i < 102400000; i++) 
    Y_serial[i] = Y[i];
  double t = 0;
  double start = read_timer();
  for (int i = 0; i < 20; i++) 
    axpy(X,Y,a);
  t += read_timer() - start;
  double t_serial = 0;
  double start_serial = read_timer();
  for (int i = 0; i < 20; i++) 
    axpy_serial(X,Y_serial,a);
  t_serial += read_timer() - start_serial;
  print_vector(Y);
  puts("---------------------------------");
  print_vector(Y_serial);
  double gflops = 2.0 * 102400000 * 102400000 * 20 / (1.0e9 * t);
  double gflops_serial = 2.0 * 102400000 * 102400000 * 20 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("AXPY (SIMD):\t\t%4f\t%4f\n",t / 20,gflops);
  printf("AXPY (Serial):\t\t%4f\t%4f\n",t_serial / 20,gflops_serial);
  printf("Correctness check: %f\n",(check(Y,Y_serial)));
  free(X);
  free(Y);
  free(Y_serial);
  return 0;
}
