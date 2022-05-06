#include "rex_kmp.h" 
//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <arm_sve.h> 
#define N_RUNS 500
#define N 10240
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
  for (size_t i = 0; i < 10240; i++) {
    X[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

float sum(float *X)
{
  size_t i;
  float result = 0;
  svbool_t __pg0 = svwhilelt_b32((unsigned long )0,((unsigned long )10240) - 1);
  svfloat32_t __part0 = svdup_f32(0.00000L);
  svfloat32_t __part3 = svdup_f32(0.00000L);
  svfloat32_t __part6 = svdup_f32(0.00000L);
  svfloat32_t __part9 = svdup_f32(0.00000L);
  svfloat32_t __part12 = svdup_f32(0.00000L);
  svfloat32_t __part15 = svdup_f32(0.00000L);
  svfloat32_t __part18 = svdup_f32(0.00000L);
  svfloat32_t __part21 = svdup_f32(0.00000L);
  for (i = ((size_t )0); i <= ((unsigned long )10240) - 1; i += 8 * svcntw()) {
    svfloat32_t __vec1 = svld1(__pg0,&X[i]);
    svfloat32_t __vec2 = svadd_f32_m(__pg0,__vec1,__part0);
    __part0 = (__vec2);
    svfloat32_t __vec4 = svld1(__pg0,&X[i + svcntw() * 1]);
    svfloat32_t __vec5 = svadd_f32_m(__pg0,__vec4,__part3);
    __part3 = (__vec5);
    svfloat32_t __vec7 = svld1(__pg0,&X[i + svcntw() * 2]);
    svfloat32_t __vec8 = svadd_f32_m(__pg0,__vec7,__part6);
    __part6 = (__vec8);
    svfloat32_t __vec10 = svld1(__pg0,&X[i + svcntw() * 3]);
    svfloat32_t __vec11 = svadd_f32_m(__pg0,__vec10,__part9);
    __part9 = (__vec11);
    svfloat32_t __vec13 = svld1(__pg0,&X[i + svcntw() * 4]);
    svfloat32_t __vec14 = svadd_f32_m(__pg0,__vec13,__part12);
    __part12 = (__vec14);
    svfloat32_t __vec16 = svld1(__pg0,&X[i + svcntw() * 5]);
    svfloat32_t __vec17 = svadd_f32_m(__pg0,__vec16,__part15);
    __part15 = (__vec17);
    svfloat32_t __vec19 = svld1(__pg0,&X[i + svcntw() * 6]);
    svfloat32_t __vec20 = svadd_f32_m(__pg0,__vec19,__part18);
    __part18 = (__vec20);
    svfloat32_t __vec22 = svld1(__pg0,&X[i + svcntw() * 7]);
    svfloat32_t __vec23 = svadd_f32_m(__pg0,__vec22,__part21);
    __part21 = (__vec23);
    __pg0 = svwhilelt_b32(i,((unsigned long )10240) - 1);
  }
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part21);
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part18);
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part15);
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part12);
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part9);
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part6);
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part3);
  __pg0 = svptrue_b32();
  result += svaddv(__pg0,__part0);
  return result;
}
// Debug functions

float sum_serial(float *X)
{
  float result = 0;
  for (size_t i = 0; i < 10240; i++) {
    result += X[i];
  }
  return result;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  float *X = (malloc(sizeof(float ) * 10240));
  float result;
  float result_serial;
  srand((time(((void *)0))));
  init(X);
//warming up
  result = sum(X);
  result_serial = sum_serial(X);
  double t = 0;
  double start = read_timer();
  for (int i = 0; i < 500; i++) {
    fprintf(stderr,"%d ",i);
    result = sum(X);
    fprintf(stderr,"(%f)",result);
  }
  fprintf(stderr,"\n");
  t += read_timer() - start;
  double t_serial = 0;
  double start_serial = read_timer();
  for (int i = 0; i < 500; i++) 
    result_serial = sum_serial(X);
  t_serial += read_timer() - start_serial;
  double gflops = 2.0 * 10240 * 10240 * 500 / (1.0e9 * t);
  double gflops_serial = 2.0 * 10240 * 10240 * 500 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("Sum (SIMD):\t\t%4f\t%4f\n",t / 500,gflops);
  printf("Sum (Serial):\t\t%4f\t%4f\n",t_serial / 500,gflops_serial);
  printf("Correctness check: %f (Serial: %f | SIMD: %f)\n",(result_serial - result),result_serial,result);
//printf("%4f\n", t/N_RUNS);
  free(X);
  return 0;
}
