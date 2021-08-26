#include "rex_kmp.h" 
//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <arm_sve.h> 
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

void init(float *X)
{
  for (int i = 0; i < 102400000; i++) {
    X[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

float sum(float *X)
{
  int i;
  float result = 0;
  svbool_t __pg0 = svwhilelt_b32(0,102399999);
  svfloat32_t __vec0 = svdup_f32(result);
  svfloat32_t __part3 = svdup_f32(0.00000L);
  for (i = 0; i <= 102399999; i += svcntw()) {
    svfloat32_t __vec1 = svld1(__pg0,&X[i]);
    svfloat32_t __vec2 = svadd_f32_m(__pg0,__vec1,__vec0);
    __part3 = svadd_f32_m(__pg0,__part3,__vec2);
    __pg0 = svwhilelt_b32(i,102399999);
  }
  float __buf0[(svcntw())];
  __pg0 = svwhilelt_b32((uint64_t )0,(svcntw()));
  svst1(__pg0,&__buf0,__part3);
  for (int __i = 0; __i < svcntw(); ++__i) 
    result += __buf0[__i];
  return result;
}
// Debug functions

float sum_serial(float *X)
{
  float result = 0;
  for (int i = 0; i < 102400000; i++) {
    result += X[i];
  }
  return result;
}

void print_vector(float *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%.2f ",vector[i]);
  }
  puts("]");
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  float *X = (malloc(sizeof(float ) * 102400000));
  float result;
  float result_serial;
  srand((time(((void *)0))));
  init(X);
//warming up
  result = sum(X);
  result_serial = sum_serial(X);
  double t = 0;
  double start = read_timer();
  for (int i = 0; i < 20; i++) 
    result = sum(X);
  t += read_timer() - start;
  double t_serial = 0;
  double start_serial = read_timer();
  for (int i = 0; i < 20; i++) 
    result_serial = sum_serial(X);
  t_serial += read_timer() - start_serial;
  print_vector(X);
  puts("=\n");
  printf("SIMD: %f\n",result);
  puts("---------------------------------");
  printf("Serial: %f\n",result_serial);
  double gflops = 2.0 * 102400000 * 102400000 * 20 / (1.0e9 * t);
  double gflops_serial = 2.0 * 102400000 * 102400000 * 20 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("Sum (SIMD):\t\t%4f\t%4f\n",t / 20,gflops);
  printf("Sum (Serial):\t\t%4f\t%4f\n",t_serial / 20,gflops_serial);
  printf("Correctness check: %f\n",(result_serial - result));
  free(X);
  return 0;
}
