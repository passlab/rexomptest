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
  int i;
  svbool_t __pg0 = svwhilelt_b32((unsigned long )0,102399999);
  svfloat32_t __vec1 = svdup_f32(a);
  svfloat32_t __vec6 = svdup_f32(a);
  svfloat32_t __vec11 = svdup_f32(a);
  svfloat32_t __vec16 = svdup_f32(a);
  svfloat32_t __vec21 = svdup_f32(a);
  svfloat32_t __vec26 = svdup_f32(a);
  svfloat32_t __vec31 = svdup_f32(a);
  svfloat32_t __vec36 = svdup_f32(a);
  svfloat32_t __vec41 = svdup_f32(a);
  svfloat32_t __vec46 = svdup_f32(a);
  svfloat32_t __vec51 = svdup_f32(a);
  svfloat32_t __vec56 = svdup_f32(a);
  svfloat32_t __vec61 = svdup_f32(a);
  svfloat32_t __vec66 = svdup_f32(a);
  svfloat32_t __vec71 = svdup_f32(a);
  svfloat32_t __vec76 = svdup_f32(a);
  for (i = 0; i <= 102399999; i += 16 * svcntw()) {
    svfloat32_t __vec0 = svld1(__pg0,&Y[i]);
    svfloat32_t __vec2 = svld1(__pg0,&X[i]);
    svfloat32_t __vec3 = svmul_f32_m(__pg0,__vec2,__vec1);
    svfloat32_t __vec4 = svadd_f32_m(__pg0,__vec3,__vec0);
    svst1(__pg0,&Y[i],__vec4);
    svfloat32_t __vec5 = svld1(__pg0,&Y[i + svcntw() * 1]);
    svfloat32_t __vec7 = svld1(__pg0,&X[i + svcntw() * 1]);
    svfloat32_t __vec8 = svmul_f32_m(__pg0,__vec7,__vec6);
    svfloat32_t __vec9 = svadd_f32_m(__pg0,__vec8,__vec5);
    svst1(__pg0,&Y[i + svcntw() * 1],__vec9);
    svfloat32_t __vec10 = svld1(__pg0,&Y[i + svcntw() * 2]);
    svfloat32_t __vec12 = svld1(__pg0,&X[i + svcntw() * 2]);
    svfloat32_t __vec13 = svmul_f32_m(__pg0,__vec12,__vec11);
    svfloat32_t __vec14 = svadd_f32_m(__pg0,__vec13,__vec10);
    svst1(__pg0,&Y[i + svcntw() * 2],__vec14);
    svfloat32_t __vec15 = svld1(__pg0,&Y[i + svcntw() * 3]);
    svfloat32_t __vec17 = svld1(__pg0,&X[i + svcntw() * 3]);
    svfloat32_t __vec18 = svmul_f32_m(__pg0,__vec17,__vec16);
    svfloat32_t __vec19 = svadd_f32_m(__pg0,__vec18,__vec15);
    svst1(__pg0,&Y[i + svcntw() * 3],__vec19);
    svfloat32_t __vec20 = svld1(__pg0,&Y[i + svcntw() * 4]);
    svfloat32_t __vec22 = svld1(__pg0,&X[i + svcntw() * 4]);
    svfloat32_t __vec23 = svmul_f32_m(__pg0,__vec22,__vec21);
    svfloat32_t __vec24 = svadd_f32_m(__pg0,__vec23,__vec20);
    svst1(__pg0,&Y[i + svcntw() * 4],__vec24);
    svfloat32_t __vec25 = svld1(__pg0,&Y[i + svcntw() * 5]);
    svfloat32_t __vec27 = svld1(__pg0,&X[i + svcntw() * 5]);
    svfloat32_t __vec28 = svmul_f32_m(__pg0,__vec27,__vec26);
    svfloat32_t __vec29 = svadd_f32_m(__pg0,__vec28,__vec25);
    svst1(__pg0,&Y[i + svcntw() * 5],__vec29);
    svfloat32_t __vec30 = svld1(__pg0,&Y[i + svcntw() * 6]);
    svfloat32_t __vec32 = svld1(__pg0,&X[i + svcntw() * 6]);
    svfloat32_t __vec33 = svmul_f32_m(__pg0,__vec32,__vec31);
    svfloat32_t __vec34 = svadd_f32_m(__pg0,__vec33,__vec30);
    svst1(__pg0,&Y[i + svcntw() * 6],__vec34);
    svfloat32_t __vec35 = svld1(__pg0,&Y[i + svcntw() * 7]);
    svfloat32_t __vec37 = svld1(__pg0,&X[i + svcntw() * 7]);
    svfloat32_t __vec38 = svmul_f32_m(__pg0,__vec37,__vec36);
    svfloat32_t __vec39 = svadd_f32_m(__pg0,__vec38,__vec35);
    svst1(__pg0,&Y[i + svcntw() * 7],__vec39);
    svfloat32_t __vec40 = svld1(__pg0,&Y[i + svcntw() * 8]);
    svfloat32_t __vec42 = svld1(__pg0,&X[i + svcntw() * 8]);
    svfloat32_t __vec43 = svmul_f32_m(__pg0,__vec42,__vec41);
    svfloat32_t __vec44 = svadd_f32_m(__pg0,__vec43,__vec40);
    svst1(__pg0,&Y[i + svcntw() * 8],__vec44);
    svfloat32_t __vec45 = svld1(__pg0,&Y[i + svcntw() * 9]);
    svfloat32_t __vec47 = svld1(__pg0,&X[i + svcntw() * 9]);
    svfloat32_t __vec48 = svmul_f32_m(__pg0,__vec47,__vec46);
    svfloat32_t __vec49 = svadd_f32_m(__pg0,__vec48,__vec45);
    svst1(__pg0,&Y[i + svcntw() * 9],__vec49);
    svfloat32_t __vec50 = svld1(__pg0,&Y[i + svcntw() * 10]);
    svfloat32_t __vec52 = svld1(__pg0,&X[i + svcntw() * 10]);
    svfloat32_t __vec53 = svmul_f32_m(__pg0,__vec52,__vec51);
    svfloat32_t __vec54 = svadd_f32_m(__pg0,__vec53,__vec50);
    svst1(__pg0,&Y[i + svcntw() * 10],__vec54);
    svfloat32_t __vec55 = svld1(__pg0,&Y[i + svcntw() * 11]);
    svfloat32_t __vec57 = svld1(__pg0,&X[i + svcntw() * 11]);
    svfloat32_t __vec58 = svmul_f32_m(__pg0,__vec57,__vec56);
    svfloat32_t __vec59 = svadd_f32_m(__pg0,__vec58,__vec55);
    svst1(__pg0,&Y[i + svcntw() * 11],__vec59);
    svfloat32_t __vec60 = svld1(__pg0,&Y[i + svcntw() * 12]);
    svfloat32_t __vec62 = svld1(__pg0,&X[i + svcntw() * 12]);
    svfloat32_t __vec63 = svmul_f32_m(__pg0,__vec62,__vec61);
    svfloat32_t __vec64 = svadd_f32_m(__pg0,__vec63,__vec60);
    svst1(__pg0,&Y[i + svcntw() * 12],__vec64);
    svfloat32_t __vec65 = svld1(__pg0,&Y[i + svcntw() * 13]);
    svfloat32_t __vec67 = svld1(__pg0,&X[i + svcntw() * 13]);
    svfloat32_t __vec68 = svmul_f32_m(__pg0,__vec67,__vec66);
    svfloat32_t __vec69 = svadd_f32_m(__pg0,__vec68,__vec65);
    svst1(__pg0,&Y[i + svcntw() * 13],__vec69);
    svfloat32_t __vec70 = svld1(__pg0,&Y[i + svcntw() * 14]);
    svfloat32_t __vec72 = svld1(__pg0,&X[i + svcntw() * 14]);
    svfloat32_t __vec73 = svmul_f32_m(__pg0,__vec72,__vec71);
    svfloat32_t __vec74 = svadd_f32_m(__pg0,__vec73,__vec70);
    svst1(__pg0,&Y[i + svcntw() * 14],__vec74);
    svfloat32_t __vec75 = svld1(__pg0,&Y[i + svcntw() * 15]);
    svfloat32_t __vec77 = svld1(__pg0,&X[i + svcntw() * 15]);
    svfloat32_t __vec78 = svmul_f32_m(__pg0,__vec77,__vec76);
    svfloat32_t __vec79 = svadd_f32_m(__pg0,__vec78,__vec75);
    svst1(__pg0,&Y[i + svcntw() * 15],__vec79);
    __pg0 = svwhilelt_b32(i,102399999);
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
