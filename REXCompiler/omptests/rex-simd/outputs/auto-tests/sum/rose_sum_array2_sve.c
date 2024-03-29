#include "rex_kmp.h" 
//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <arm_sve.h> 
#define N_RUNS 1000
#define N 120000
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//Create a matrix and a vector and fill with random numbers

void init(int *X)
{
  for (int i = 0; i < 120000; i++) {
    X[i] = ((int )(rand())) / ((int )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

int sum(int *X,int *Y,int *answer)
{
  int i;
  int result = 0;
  svbool_t __pg0 = svwhilelt_b32(0,119999);
  svint32_t __vec2 = svdup_s32(2);
  for (i = 0; i <= 119999; i += svcntw()) {
    svint32_t __vec0 = svld1(__pg0,&X[i]);
    svint32_t __vec1 = svld1(__pg0,&Y[i]);
    svint32_t __vec3 = svmul_s32_m(__pg0,__vec2,__vec1);
    svint32_t __vec4 = svadd_s32_m(__pg0,__vec3,__vec0);
    svst1(__pg0,&answer[i],__vec4);
    __pg0 = svwhilelt_b32(i,119999);
  }
  return result;
}
// Debug functions

int sum_serial(int *X,int *Y,int *answer)
{
  int result = 0;
  for (int i = 0; i < 120000; i++) {
    answer[i] = X[i] + Y[i] * 2;
  }
  return result;
}

void print_vector(int *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%d ",vector[i]);
  }
  puts("]");
}

int check(int *serial,int *SIMD)
{
  int diff = 0;
  for (int i = 0; i < 120000; i++) 
    diff += serial[i] - SIMD[i];
  return diff;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  int *X = (malloc(sizeof(int ) * 120000));
  int *Y = (malloc(sizeof(int ) * 120000));
  int *answer = (malloc(sizeof(int ) * 120000));
  int *answer_serial = (malloc(sizeof(int ) * 120000));
  srand((time(((void *)0))));
  init(X);
  init(Y);
  double start = read_timer();
  for (int i = 0; i < 1000; i++) 
    sum(X,Y,answer);
  double t = read_timer() - start;
  double start_serial = read_timer();
  for (int i = 0; i < 1000; i++) 
    sum_serial(X,Y,answer_serial);
  double t_serial = read_timer() - start_serial;
  printf("X: ");
  print_vector(X);
  puts("+");
  printf("Y: ");
  print_vector(Y);
  puts("=\n");
  printf("SIMD:\n");
  print_vector(answer);
  puts("---------------------------------");
  printf("Serial:\n");
  print_vector(answer_serial);
  double gflops = 2.0 * 120000 * 120000 * 1000 / (1.0e9 * t);
  double gflops_serial = 2.0 * 120000 * 120000 * 1000 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("Sum (SIMD):\t\t%4f\t%4f\n",t,gflops);
  printf("Sum (Serial):\t\t%4f\t%4f\n",t_serial,gflops_serial);
  printf("Correctness:\t\t%d\n",(check(answer_serial,answer)));
  free(X);
  free(Y);
  free(answer);
  free(answer_serial);
  return 0;
}
