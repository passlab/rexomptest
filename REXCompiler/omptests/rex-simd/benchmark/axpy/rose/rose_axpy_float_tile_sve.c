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

void init(float *X,float *Y)
{
  for (int i = 0; i < 102400000; i++) {
    X[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
    Y[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

void axpy(float *X,float *Y,float a)
{
  svfloat32_t __vec1 = svdup_f32(a);
  int i;
  int _lt_var_inc = 1;
  int _lt_var_i;
  svbool_t __pg0 = svwhilelt_b32((unsigned long )0,(unsigned long )((102399999 < (_lt_var_i + _lt_var_inc * 2 - 1))?102399999 : (_lt_var_i + _lt_var_inc * 2 - 1)));
  for (_lt_var_i = 0; _lt_var_i <= 102399999; _lt_var_i += _lt_var_inc * 2) {
    for (i = _lt_var_i; i <= (((102399999 < (_lt_var_i + _lt_var_inc * 2 - 1))?102399999 : (_lt_var_i + _lt_var_inc * 2 - 1))); i += 1 * svcntw()) {
      svfloat32_t __vec0 = svld1(__pg0,&Y[i]);
      svfloat32_t __vec2 = svld1(__pg0,&X[i]);
      svfloat32_t __vec3 = svmul_f32_m(__pg0,__vec2,__vec1);
      svfloat32_t __vec4 = svadd_f32_m(__pg0,__vec3,__vec0);
      svst1(__pg0,&Y[i],__vec4);
      __pg0 = svwhilelt_b32((unsigned long )i,(unsigned long )(((102399999 < (_lt_var_i + _lt_var_inc * 2 - 1))?102399999 : (_lt_var_i + _lt_var_inc * 2 - 1))));
    }
  }
  for (i = _lt_var_i; i <= (((102399999 < (_lt_var_i + _lt_var_inc * 2 - 1))?102399999 : (_lt_var_i + _lt_var_inc * 2 - 1))); i += 1 * svcntw()) {
    svfloat32_t __vec0 = svld1(__pg0,&Y[i]);
    svfloat32_t __vec2 = svld1(__pg0,&X[i]);
    svfloat32_t __vec3 = svmul_f32_m(__pg0,__vec2,__vec1);
    svfloat32_t __vec4 = svadd_f32_m(__pg0,__vec3,__vec0);
    svst1(__pg0,&Y[i],__vec4);
    __pg0 = svwhilelt_b32((unsigned long )i,(unsigned long )(((102399999 < (_lt_var_i + _lt_var_inc * 2 - 1))?102399999 : (_lt_var_i + _lt_var_inc * 2 - 1))));
  }
}
// Debug functions

void axpy_serial(float *X,float *Y,float a)
{
  for (int i = 0; i < 102400000; i++) {
    Y[i] += a * X[i];
  }
}

float check(float *A,float *B)
{
  float difference = 0;
  for (int i = 0; i < 102400000; i++) {
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
    printf("Correctness check: %f\n", check(Y,Y_serial));
    printf("(%f, %f) | (%f, %f) | (%f, %f) | (%f, %f)\n", Y[0], Y_serial[0], Y[50], Y_serial[50], Y[100], Y_serial[100], Y[1000], Y_serial[1000]);*/
  printf("%4f\n",t / 20);
  free(X);
  free(Y);
  free(Y_serial);
  return 0;
}
