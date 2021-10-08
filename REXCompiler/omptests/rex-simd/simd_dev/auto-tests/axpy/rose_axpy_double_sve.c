#include "rex_kmp.h" 
//axpy.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <arm_sve.h> 
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

void init(double *X,double *Y)
{
  for (int i = 0; i < 1200; i++) {
    X[i] = ((double )(rand())) / ((double )(2147483647 / 10.0));
    Y[i] = ((double )(rand())) / ((double )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

void axpy(double *X,double *Y,double a)
{
  int i;
  svbool_t __pg0 = svwhilelt_b64(0,1199);
  svfloat64_t __vec1 = svdup_f64(a);
  for (i = 0; i <= 1199; i += svcntd()) {
    svfloat64_t __vec0 = svld1(__pg0,&Y[i]);
    svfloat64_t __vec2 = svld1(__pg0,&X[i]);
    svfloat64_t __vec3 = svmul_f64_m(__pg0,__vec2,__vec1);
    svfloat64_t __vec4 = svadd_f64_m(__pg0,__vec3,__vec0);
    svst1(__pg0,&Y[i],__vec4);
    __pg0 = svwhilelt_b64(i,1199);
  }
}
// Debug functions

void axpy_serial(double *X,double *Y,double a)
{
  for (int i = 0; i < 1200; i++) {
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
  for (int i = 0; i < 1200; i++) {
    difference += A[i] - B[i];
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  double *X = (malloc(sizeof(double ) * 1200));
  double *Y = (malloc(sizeof(double ) * 1200));
  double *Y_serial = (malloc(sizeof(double ) * 1200));
  double a = 3.14;
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
