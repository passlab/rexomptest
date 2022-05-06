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
      temp = 0;
      size_t k = 0;
      __m512 __part0 = _mm512_setzero_ps();
      __m512 __part7 = _mm512_setzero_ps();
      __m512 __part14 = _mm512_setzero_ps();
      __m512 __part21 = _mm512_setzero_ps();
      __m512 __part28 = _mm512_setzero_ps();
      __m512 __part35 = _mm512_setzero_ps();
      __m512 __part42 = _mm512_setzero_ps();
      __m512 __part49 = _mm512_setzero_ps();
      for (k = 0; k <= ((unsigned long )1024) - 1; k += 8 * 16) {
        float *__ptr1 = A[i];
        __m512 __vec2 = _mm512_loadu_ps(&__ptr1[k]);
        float *__ptr3 = B[j];
        __m512 __vec4 = _mm512_loadu_ps(&__ptr3[k]);
        __m512 __vec5 = _mm512_mul_ps(__vec4,__vec2);
        __m512 __vec6 = _mm512_add_ps(__vec5,__part0);
        __part0 = (__vec6);
        float *__ptr8 = A[i];
        __m512 __vec9 = _mm512_loadu_ps(&__ptr8[k + 16 * 1]);
        float *__ptr10 = B[j];
        __m512 __vec11 = _mm512_loadu_ps(&__ptr10[k + 16 * 1]);
        __m512 __vec12 = _mm512_mul_ps(__vec11,__vec9);
        __m512 __vec13 = _mm512_add_ps(__vec12,__part7);
        __part7 = (__vec13);
        float *__ptr15 = A[i];
        __m512 __vec16 = _mm512_loadu_ps(&__ptr15[k + 16 * 2]);
        float *__ptr17 = B[j];
        __m512 __vec18 = _mm512_loadu_ps(&__ptr17[k + 16 * 2]);
        __m512 __vec19 = _mm512_mul_ps(__vec18,__vec16);
        __m512 __vec20 = _mm512_add_ps(__vec19,__part14);
        __part14 = (__vec20);
        float *__ptr22 = A[i];
        __m512 __vec23 = _mm512_loadu_ps(&__ptr22[k + 16 * 3]);
        float *__ptr24 = B[j];
        __m512 __vec25 = _mm512_loadu_ps(&__ptr24[k + 16 * 3]);
        __m512 __vec26 = _mm512_mul_ps(__vec25,__vec23);
        __m512 __vec27 = _mm512_add_ps(__vec26,__part21);
        __part21 = (__vec27);
        float *__ptr29 = A[i];
        __m512 __vec30 = _mm512_loadu_ps(&__ptr29[k + 16 * 4]);
        float *__ptr31 = B[j];
        __m512 __vec32 = _mm512_loadu_ps(&__ptr31[k + 16 * 4]);
        __m512 __vec33 = _mm512_mul_ps(__vec32,__vec30);
        __m512 __vec34 = _mm512_add_ps(__vec33,__part28);
        __part28 = (__vec34);
        float *__ptr36 = A[i];
        __m512 __vec37 = _mm512_loadu_ps(&__ptr36[k + 16 * 5]);
        float *__ptr38 = B[j];
        __m512 __vec39 = _mm512_loadu_ps(&__ptr38[k + 16 * 5]);
        __m512 __vec40 = _mm512_mul_ps(__vec39,__vec37);
        __m512 __vec41 = _mm512_add_ps(__vec40,__part35);
        __part35 = (__vec41);
        float *__ptr43 = A[i];
        __m512 __vec44 = _mm512_loadu_ps(&__ptr43[k + 16 * 6]);
        float *__ptr45 = B[j];
        __m512 __vec46 = _mm512_loadu_ps(&__ptr45[k + 16 * 6]);
        __m512 __vec47 = _mm512_mul_ps(__vec46,__vec44);
        __m512 __vec48 = _mm512_add_ps(__vec47,__part42);
        __part42 = (__vec48);
        float *__ptr50 = A[i];
        __m512 __vec51 = _mm512_loadu_ps(&__ptr50[k + 16 * 7]);
        float *__ptr52 = B[j];
        __m512 __vec53 = _mm512_loadu_ps(&__ptr52[k + 16 * 7]);
        __m512 __vec54 = _mm512_mul_ps(__vec53,__vec51);
        __m512 __vec55 = _mm512_add_ps(__vec54,__part49);
        __part49 = (__vec55);
      }
      __m256 __buf21 = _mm512_extractf32x8_ps(__part49,0);
      __m256 __buf22 = _mm512_extractf32x8_ps(__part49,1);
      __buf22 = _mm256_add_ps(__buf21,__buf22);
      __buf22 = _mm256_hadd_ps(__buf22,__buf22);
      __buf22 = _mm256_hadd_ps(__buf22,__buf22);
      float __buf23[8];
      _mm256_storeu_ps(&__buf23,__buf22);
      temp += __buf23[0] + __buf23[6];
      __m256 __buf18 = _mm512_extractf32x8_ps(__part42,0);
      __m256 __buf19 = _mm512_extractf32x8_ps(__part42,1);
      __buf19 = _mm256_add_ps(__buf18,__buf19);
      __buf19 = _mm256_hadd_ps(__buf19,__buf19);
      __buf19 = _mm256_hadd_ps(__buf19,__buf19);
      float __buf20[8];
      _mm256_storeu_ps(&__buf20,__buf19);
      temp += __buf20[0] + __buf20[6];
      __m256 __buf15 = _mm512_extractf32x8_ps(__part35,0);
      __m256 __buf16 = _mm512_extractf32x8_ps(__part35,1);
      __buf16 = _mm256_add_ps(__buf15,__buf16);
      __buf16 = _mm256_hadd_ps(__buf16,__buf16);
      __buf16 = _mm256_hadd_ps(__buf16,__buf16);
      float __buf17[8];
      _mm256_storeu_ps(&__buf17,__buf16);
      temp += __buf17[0] + __buf17[6];
      __m256 __buf12 = _mm512_extractf32x8_ps(__part28,0);
      __m256 __buf13 = _mm512_extractf32x8_ps(__part28,1);
      __buf13 = _mm256_add_ps(__buf12,__buf13);
      __buf13 = _mm256_hadd_ps(__buf13,__buf13);
      __buf13 = _mm256_hadd_ps(__buf13,__buf13);
      float __buf14[8];
      _mm256_storeu_ps(&__buf14,__buf13);
      temp += __buf14[0] + __buf14[6];
      __m256 __buf9 = _mm512_extractf32x8_ps(__part21,0);
      __m256 __buf10 = _mm512_extractf32x8_ps(__part21,1);
      __buf10 = _mm256_add_ps(__buf9,__buf10);
      __buf10 = _mm256_hadd_ps(__buf10,__buf10);
      __buf10 = _mm256_hadd_ps(__buf10,__buf10);
      float __buf11[8];
      _mm256_storeu_ps(&__buf11,__buf10);
      temp += __buf11[0] + __buf11[6];
      __m256 __buf6 = _mm512_extractf32x8_ps(__part14,0);
      __m256 __buf7 = _mm512_extractf32x8_ps(__part14,1);
      __buf7 = _mm256_add_ps(__buf6,__buf7);
      __buf7 = _mm256_hadd_ps(__buf7,__buf7);
      __buf7 = _mm256_hadd_ps(__buf7,__buf7);
      float __buf8[8];
      _mm256_storeu_ps(&__buf8,__buf7);
      temp += __buf8[0] + __buf8[6];
      __m256 __buf3 = _mm512_extractf32x8_ps(__part7,0);
      __m256 __buf4 = _mm512_extractf32x8_ps(__part7,1);
      __buf4 = _mm256_add_ps(__buf3,__buf4);
      __buf4 = _mm256_hadd_ps(__buf4,__buf4);
      __buf4 = _mm256_hadd_ps(__buf4,__buf4);
      float __buf5[8];
      _mm256_storeu_ps(&__buf5,__buf4);
      temp += __buf5[0] + __buf5[6];
      __m256 __buf0 = _mm512_extractf32x8_ps(__part0,0);
      __m256 __buf1 = _mm512_extractf32x8_ps(__part0,1);
      __buf1 = _mm256_add_ps(__buf0,__buf1);
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
