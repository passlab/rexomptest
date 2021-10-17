#include "rex_kmp.h" 
//axpy.c
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

void init(int *X,int *Y)
{
  for (int i = 0; i < 102400000; i++) {
    X[i] = ((int )(rand())) / ((int )(2147483647 / 10.0));
    Y[i] = ((int )(rand())) / ((int )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

void axpy(int *X,int *Y,int a)
{
  int i;
  svbool_t __pg0 = svwhilelt_b32(0,102399999);
  svint32_t __vec1 = svdup_s32(a);
  for (i = 0; i <= 102399999; i += svcntw()) {
    svint32_t __vec0 = svld1(__pg0,&Y[i]);
    svint32_t __vec2 = svld1(__pg0,&X[i]);
    svint32_t __vec3 = svmul_s32_m(__pg0,__vec2,__vec1);
    svint32_t __vec4 = svadd_s32_m(__pg0,__vec3,__vec0);
    svst1(__pg0,&Y[i],__vec4);
    __pg0 = svwhilelt_b32(i,102399999);
  }
}
// Debug functions

void axpy_serial(int *X,int *Y,int a)
{
  for (int i = 0; i < 102400000; i++) {
    Y[i] += a * X[i];
  }
}

void print_vector(int *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%d ",vector[i]);
  }
  puts("]");
}

int check(int *A,int *B)
{
  int difference = 0;
  for (int i = 0; i < 102400000; i++) {
    difference += A[i] - B[i];
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  int *X = (malloc(sizeof(int ) * 102400000));
  int *Y = (malloc(sizeof(int ) * 102400000));
  int *Y_serial = (malloc(sizeof(int ) * 102400000));
  int a = 3;
  srand((time(((void *)0))));
  init(X,Y);
  for (int i = 0; i < 102400000; i++) 
    Y_serial[i] = Y[i];
  print_vector(Y);
  print_vector(X);
  printf("%d\n",a);
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
  printf("Correctness check: %d\n",(check(Y,Y_serial)));
  free(X);
  free(Y);
  free(Y_serial);
  return 0;
}
