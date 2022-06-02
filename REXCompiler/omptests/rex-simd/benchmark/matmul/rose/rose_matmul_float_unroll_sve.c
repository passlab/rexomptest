#include "rex_kmp.h" 
/*
 * Square matrix multiplication
 * A[N][N] * B[N][N] = C[N][N]
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <arm_sve.h> 
#define N 1024
//#define N 16
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}

void init(float **A)
{
  for (size_t i = 0; i < 1024; i++) {
    for (size_t j = 0; j < 1024; j++) {
      A[i][j] = ((float )(rand())) / ((float )(2147483647 / 10.0));
    }
  }
}

void matmul_simd(float **A,float **B,float **C)
{
  float temp;
  for (size_t i = 0; i < 1024; i++) {
    for (size_t j = 0; j < 1024; j++) {
      svfloat32_t __part0 = svdup_f32(0.00000L);
      temp = 0;
      size_t k = 0;
      svbool_t __pg0 = svwhilelt_b32((unsigned long )0,(unsigned long )(((unsigned long )1024) - 1));
      for (k = 0; k <= (((unsigned long )1024) - 1); k += 8 * svcntw()) {
        float *__ptr1 = A[i];
        svfloat32_t __vec2 = svld1(__pg0,&__ptr1[k]);
        float *__ptr3 = B[j];
        svfloat32_t __vec4 = svld1(__pg0,&__ptr3[k]);
        svfloat32_t __vec5 = svmul_f32_m(__pg0,__vec4,__vec2);
        svfloat32_t __vec6 = svadd_f32_m(__pg0,__vec5,__part0);
        __part0 = (__vec6);
        float *__ptr7 = A[i];
        svfloat32_t __vec8 = svld1(__pg0,&__ptr7[k + svcntw() * 1]);
        float *__ptr9 = B[j];
        svfloat32_t __vec10 = svld1(__pg0,&__ptr9[k + svcntw() * 1]);
        svfloat32_t __vec11 = svmul_f32_m(__pg0,__vec10,__vec8);
        svfloat32_t __vec12 = svadd_f32_m(__pg0,__vec11,__part0);
        __part0 = (__vec12);
        float *__ptr13 = A[i];
        svfloat32_t __vec14 = svld1(__pg0,&__ptr13[k + svcntw() * 2]);
        float *__ptr15 = B[j];
        svfloat32_t __vec16 = svld1(__pg0,&__ptr15[k + svcntw() * 2]);
        svfloat32_t __vec17 = svmul_f32_m(__pg0,__vec16,__vec14);
        svfloat32_t __vec18 = svadd_f32_m(__pg0,__vec17,__part0);
        __part0 = (__vec18);
        float *__ptr19 = A[i];
        svfloat32_t __vec20 = svld1(__pg0,&__ptr19[k + svcntw() * 3]);
        float *__ptr21 = B[j];
        svfloat32_t __vec22 = svld1(__pg0,&__ptr21[k + svcntw() * 3]);
        svfloat32_t __vec23 = svmul_f32_m(__pg0,__vec22,__vec20);
        svfloat32_t __vec24 = svadd_f32_m(__pg0,__vec23,__part0);
        __part0 = (__vec24);
        float *__ptr25 = A[i];
        svfloat32_t __vec26 = svld1(__pg0,&__ptr25[k + svcntw() * 4]);
        float *__ptr27 = B[j];
        svfloat32_t __vec28 = svld1(__pg0,&__ptr27[k + svcntw() * 4]);
        svfloat32_t __vec29 = svmul_f32_m(__pg0,__vec28,__vec26);
        svfloat32_t __vec30 = svadd_f32_m(__pg0,__vec29,__part0);
        __part0 = (__vec30);
        float *__ptr31 = A[i];
        svfloat32_t __vec32 = svld1(__pg0,&__ptr31[k + svcntw() * 5]);
        float *__ptr33 = B[j];
        svfloat32_t __vec34 = svld1(__pg0,&__ptr33[k + svcntw() * 5]);
        svfloat32_t __vec35 = svmul_f32_m(__pg0,__vec34,__vec32);
        svfloat32_t __vec36 = svadd_f32_m(__pg0,__vec35,__part0);
        __part0 = (__vec36);
        float *__ptr37 = A[i];
        svfloat32_t __vec38 = svld1(__pg0,&__ptr37[k + svcntw() * 6]);
        float *__ptr39 = B[j];
        svfloat32_t __vec40 = svld1(__pg0,&__ptr39[k + svcntw() * 6]);
        svfloat32_t __vec41 = svmul_f32_m(__pg0,__vec40,__vec38);
        svfloat32_t __vec42 = svadd_f32_m(__pg0,__vec41,__part0);
        __part0 = (__vec42);
        float *__ptr43 = A[i];
        svfloat32_t __vec44 = svld1(__pg0,&__ptr43[k + svcntw() * 7]);
        float *__ptr45 = B[j];
        svfloat32_t __vec46 = svld1(__pg0,&__ptr45[k + svcntw() * 7]);
        svfloat32_t __vec47 = svmul_f32_m(__pg0,__vec46,__vec44);
        svfloat32_t __vec48 = svadd_f32_m(__pg0,__vec47,__part0);
        __part0 = (__vec48);
        __pg0 = svwhilelt_b32((unsigned long )k,(unsigned long )(((unsigned long )1024) - 1));
      }
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part0);
      C[i][j] = temp;
    }
  }
}

void matmul_serial(float **A,float **B,float **C)
{
  float temp;
  for (size_t i = 0; i < 1024; i++) {
    for (size_t j = 0; j < 1024; j++) {
      temp = 0;
      for (size_t k = 0; k < 1024; k++) {
        temp += A[i][k] * B[j][k];
      }
      C[i][j] = temp;
    }
  }
}

float check(float **A,float **B)
{
  float difference = 0;
  for (size_t i = 0; i < 1024; i++) {
    for (size_t j = 0; j < 1024; j++) {
      difference += A[i][j] - B[i][j];
    }
  }
  return difference;
}
// Main

int main(int argc,char *argv[])
{
  int status = 0;
//Set everything up
  float **A = (malloc(sizeof(float *) * 1024));
  float **B = (malloc(sizeof(float *) * 1024));
  float **C_simd = (malloc(sizeof(float *) * 1024));
  float **C_serial = (malloc(sizeof(float *) * 1024));
  float **BT = (malloc(sizeof(float *) * 1024));
  for (size_t i = 0; i < 1024; i++) {
    A[i] = (malloc(sizeof(float ) * 1024));
    B[i] = (malloc(sizeof(float ) * 1024));
    C_simd[i] = (malloc(sizeof(float ) * 1024));
    C_serial[i] = (malloc(sizeof(float ) * 1024));
    BT[i] = (malloc(sizeof(float ) * 1024));
  }
  srand((time(((void *)0))));
  init(A);
  init(B);
  for (size_t line = 0; line < 1024; line++) {
    for (size_t col = 0; col < 1024; col++) {
      BT[line][col] = B[col][line];
    }
  }
  int num_runs = 20;
//Warming up
  matmul_simd(A,BT,C_simd);
  matmul_serial(A,BT,C_serial);
  double elapsed = 0;
  double elapsed1 = read_timer();
  for (int i = 0; i < num_runs; i++) {
    fprintf(stderr,"%d ",i);
    matmul_simd(A,BT,C_simd);
    fprintf(stderr,"(%f,%f,%f)",C_simd[0],C_simd[1024 - 10],C_simd[1024 / 10]);
  }
  fprintf(stderr,"\n");
  elapsed += read_timer() - elapsed1;
  double elapsed_serial = 0;
  double elapsed_serial1 = read_timer();
  for (int i = 0; i < num_runs; i++) 
    matmul_serial(A,BT,C_serial);
  elapsed_serial += read_timer() - elapsed_serial1;
  double gflops_omp = 2.0 * 1024 * 1024 * 1024 * num_runs / (1.0e9 * elapsed);
  double gflops_serial = 2.0 * 1024 * 1024 * 1024 * num_runs / (1.0e9 * elapsed_serial);
/*printf("======================================================================================================\n");
    printf("\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n", N);
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("Performance:\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("matmul_omp:\t\t%4f\t%4f\n", elapsed/num_runs, gflops_omp);
    printf("matmul_serial:\t\t%4f\t%4f\n", elapsed_serial/num_runs, gflops_serial);
    printf("Correctness check: %f\n", check(C_simd,C_serial));*/
  printf("%4f\n",elapsed / num_runs);
  return 0;
}
