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
#include <immintrin.h> 
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
      __m256 __part0 = _mm256_setzero_ps();
      temp = 0;
      size_t k = 0;
      for (k = 0; k <= ((unsigned long )1024) - 1; k += 8 * 8) {
        float *__ptr1 = A[i];
        __m256 __vec2 = _mm256_loadu_ps(&__ptr1[k]);
        float *__ptr3 = B[j];
        __m256 __vec4 = _mm256_loadu_ps(&__ptr3[k]);
        __m256 __vec5 = _mm256_mul_ps(__vec4,__vec2);
        __m256 __vec6 = _mm256_add_ps(__vec5,__part0);
        __part0 = (__vec6);
        float *__ptr7 = A[i];
        __m256 __vec8 = _mm256_loadu_ps(&__ptr7[k + 8 * 1]);
        float *__ptr9 = B[j];
        __m256 __vec10 = _mm256_loadu_ps(&__ptr9[k + 8 * 1]);
        __m256 __vec11 = _mm256_mul_ps(__vec10,__vec8);
        __m256 __vec12 = _mm256_add_ps(__vec11,__part0);
        __part0 = (__vec12);
        float *__ptr13 = A[i];
        __m256 __vec14 = _mm256_loadu_ps(&__ptr13[k + 8 * 2]);
        float *__ptr15 = B[j];
        __m256 __vec16 = _mm256_loadu_ps(&__ptr15[k + 8 * 2]);
        __m256 __vec17 = _mm256_mul_ps(__vec16,__vec14);
        __m256 __vec18 = _mm256_add_ps(__vec17,__part0);
        __part0 = (__vec18);
        float *__ptr19 = A[i];
        __m256 __vec20 = _mm256_loadu_ps(&__ptr19[k + 8 * 3]);
        float *__ptr21 = B[j];
        __m256 __vec22 = _mm256_loadu_ps(&__ptr21[k + 8 * 3]);
        __m256 __vec23 = _mm256_mul_ps(__vec22,__vec20);
        __m256 __vec24 = _mm256_add_ps(__vec23,__part0);
        __part0 = (__vec24);
        float *__ptr25 = A[i];
        __m256 __vec26 = _mm256_loadu_ps(&__ptr25[k + 8 * 4]);
        float *__ptr27 = B[j];
        __m256 __vec28 = _mm256_loadu_ps(&__ptr27[k + 8 * 4]);
        __m256 __vec29 = _mm256_mul_ps(__vec28,__vec26);
        __m256 __vec30 = _mm256_add_ps(__vec29,__part0);
        __part0 = (__vec30);
        float *__ptr31 = A[i];
        __m256 __vec32 = _mm256_loadu_ps(&__ptr31[k + 8 * 5]);
        float *__ptr33 = B[j];
        __m256 __vec34 = _mm256_loadu_ps(&__ptr33[k + 8 * 5]);
        __m256 __vec35 = _mm256_mul_ps(__vec34,__vec32);
        __m256 __vec36 = _mm256_add_ps(__vec35,__part0);
        __part0 = (__vec36);
        float *__ptr37 = A[i];
        __m256 __vec38 = _mm256_loadu_ps(&__ptr37[k + 8 * 6]);
        float *__ptr39 = B[j];
        __m256 __vec40 = _mm256_loadu_ps(&__ptr39[k + 8 * 6]);
        __m256 __vec41 = _mm256_mul_ps(__vec40,__vec38);
        __m256 __vec42 = _mm256_add_ps(__vec41,__part0);
        __part0 = (__vec42);
        float *__ptr43 = A[i];
        __m256 __vec44 = _mm256_loadu_ps(&__ptr43[k + 8 * 7]);
        float *__ptr45 = B[j];
        __m256 __vec46 = _mm256_loadu_ps(&__ptr45[k + 8 * 7]);
        __m256 __vec47 = _mm256_mul_ps(__vec46,__vec44);
        __m256 __vec48 = _mm256_add_ps(__vec47,__part0);
        __part0 = (__vec48);
      }
      __m256 __buf1 = __part0;
      __buf1 = _mm256_hadd_ps(__buf1,__buf1);
      __buf1 = _mm256_hadd_ps(__buf1,__buf1);
      float __buf2[8];
      _mm256_storeu_ps(&__buf2,__buf1);
      temp += __buf2[0] + __buf2[6];
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