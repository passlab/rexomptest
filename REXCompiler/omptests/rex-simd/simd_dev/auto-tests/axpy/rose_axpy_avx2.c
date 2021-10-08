#include "rex_kmp.h" 
//axpy.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <immintrin.h> 
#define N_RUNS 1000
#define N 1200
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
  for (int i = 0; i < 1200; i++) {
    X[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
    Y[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

void axpy(float *X,float *Y,float a)
{
  int i;
  __m256 __vec1 = _mm256_set1_ps(a);
  for (i = 0; i <= 1199; i += 8) {
    __m256 __vec0 = _mm256_loadu_ps(&Y[i]);
    __m256 __vec2 = _mm256_loadu_ps(&X[i]);
    __m256 __vec3 = _mm256_mul_ps(__vec2,__vec1);
    __m256 __vec4 = _mm256_add_ps(__vec3,__vec0);
    _mm256_storeu_ps(&Y[i],__vec4);
  }
}
// Debug functions

void axpy_serial(float *X,float *Y,float a)
{
  for (int i = 0; i < 1200; i++) {
    Y[i] += a * X[i];
  }
}

void print_vector(float *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%.2f ",vector[i]);
  }
  puts("]");
}

float check(float *A,float *B)
{
  float difference = 0;
  for (int i = 0; i < 1200; i++) {
    difference += A[i] - B[i];
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  float *X = (malloc(sizeof(float ) * 1200));
  float *Y = (malloc(sizeof(float ) * 1200));
  float *Y_serial = (malloc(sizeof(float ) * 1200));
  float a = 3.14;
  srand((time(((void *)0))));
  init(X,Y);
  for (int i = 0; i < 1200; i++) 
    Y_serial[i] = Y[i];
  print_vector(Y);
  print_vector(X);
  printf("%.2f\n",a);
  puts("=\n");
  double start = read_timer();
  for (int i = 0; i < 1000; i++) 
    axpy(X,Y,a);
  double t = read_timer() - start;
  double start_serial = read_timer();
  for (int i = 0; i < 1000; i++) 
    axpy_serial(X,Y_serial,a);
  double t_serial = read_timer() - start_serial;
  print_vector(Y);
  puts("---------------------------------");
  print_vector(Y_serial);
  double gflops = 2.0 * 1200 * 1200 * 1000 / (1.0e9 * t);
  double gflops_serial = 2.0 * 1200 * 1200 * 1000 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("AXPY (SIMD):\t\t%4f\t%4f\n",t,gflops);
  printf("AXPY (Serial):\t\t%4f\t%4f\n",t_serial,gflops_serial);
  printf("Correctness check: %f\n",(check(Y,Y_serial)));
  free(X);
  free(Y);
  free(Y_serial);
  return 0;
}
