#include "rex_kmp.h" 
//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <immintrin.h> 
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
  __m256 __part0 = _mm256_setzero_ps();
  __m256 __part3 = _mm256_setzero_ps();
  __m256 __part6 = _mm256_setzero_ps();
  __m256 __part9 = _mm256_setzero_ps();
  __m256 __part12 = _mm256_setzero_ps();
  __m256 __part15 = _mm256_setzero_ps();
  __m256 __part18 = _mm256_setzero_ps();
  __m256 __part21 = _mm256_setzero_ps();
  for (i = ((size_t )0); i <= ((unsigned long )10240) - 1; i += 8 * 8) {
    __m256 __vec1 = _mm256_loadu_ps(&X[i]);
    __m256 __vec2 = _mm256_add_ps(__vec1,__part0);
    __part0 = (__vec2);
    __m256 __vec4 = _mm256_loadu_ps(&X[i + 8 * 1]);
    __m256 __vec5 = _mm256_add_ps(__vec4,__part3);
    __part3 = (__vec5);
    __m256 __vec7 = _mm256_loadu_ps(&X[i + 8 * 2]);
    __m256 __vec8 = _mm256_add_ps(__vec7,__part6);
    __part6 = (__vec8);
    __m256 __vec10 = _mm256_loadu_ps(&X[i + 8 * 3]);
    __m256 __vec11 = _mm256_add_ps(__vec10,__part9);
    __part9 = (__vec11);
    __m256 __vec13 = _mm256_loadu_ps(&X[i + 8 * 4]);
    __m256 __vec14 = _mm256_add_ps(__vec13,__part12);
    __part12 = (__vec14);
    __m256 __vec16 = _mm256_loadu_ps(&X[i + 8 * 5]);
    __m256 __vec17 = _mm256_add_ps(__vec16,__part15);
    __part15 = (__vec17);
    __m256 __vec19 = _mm256_loadu_ps(&X[i + 8 * 6]);
    __m256 __vec20 = _mm256_add_ps(__vec19,__part18);
    __part18 = (__vec20);
    __m256 __vec22 = _mm256_loadu_ps(&X[i + 8 * 7]);
    __m256 __vec23 = _mm256_add_ps(__vec22,__part21);
    __part21 = (__vec23);
  }
  __m256 __buf22 = __part21;
  __buf22 = _mm256_hadd_ps(__buf22,__buf22);
  __buf22 = _mm256_hadd_ps(__buf22,__buf22);
  float __buf23[8];
  _mm256_storeu_ps(&__buf23,__buf22);
  result += __buf23[0] + __buf23[6];
  __m256 __buf19 = __part18;
  __buf19 = _mm256_hadd_ps(__buf19,__buf19);
  __buf19 = _mm256_hadd_ps(__buf19,__buf19);
  float __buf20[8];
  _mm256_storeu_ps(&__buf20,__buf19);
  result += __buf20[0] + __buf20[6];
  __m256 __buf16 = __part15;
  __buf16 = _mm256_hadd_ps(__buf16,__buf16);
  __buf16 = _mm256_hadd_ps(__buf16,__buf16);
  float __buf17[8];
  _mm256_storeu_ps(&__buf17,__buf16);
  result += __buf17[0] + __buf17[6];
  __m256 __buf13 = __part12;
  __buf13 = _mm256_hadd_ps(__buf13,__buf13);
  __buf13 = _mm256_hadd_ps(__buf13,__buf13);
  float __buf14[8];
  _mm256_storeu_ps(&__buf14,__buf13);
  result += __buf14[0] + __buf14[6];
  __m256 __buf10 = __part9;
  __buf10 = _mm256_hadd_ps(__buf10,__buf10);
  __buf10 = _mm256_hadd_ps(__buf10,__buf10);
  float __buf11[8];
  _mm256_storeu_ps(&__buf11,__buf10);
  result += __buf11[0] + __buf11[6];
  __m256 __buf7 = __part6;
  __buf7 = _mm256_hadd_ps(__buf7,__buf7);
  __buf7 = _mm256_hadd_ps(__buf7,__buf7);
  float __buf8[8];
  _mm256_storeu_ps(&__buf8,__buf7);
  result += __buf8[0] + __buf8[6];
  __m256 __buf4 = __part3;
  __buf4 = _mm256_hadd_ps(__buf4,__buf4);
  __buf4 = _mm256_hadd_ps(__buf4,__buf4);
  float __buf5[8];
  _mm256_storeu_ps(&__buf5,__buf4);
  result += __buf5[0] + __buf5[6];
  __m256 __buf1 = __part0;
  __buf1 = _mm256_hadd_ps(__buf1,__buf1);
  __buf1 = _mm256_hadd_ps(__buf1,__buf1);
  float __buf2[8];
  _mm256_storeu_ps(&__buf2,__buf1);
  result += __buf2[0] + __buf2[6];
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
/*printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("Sum (SIMD):\t\t%4f\t%4f\n", t/N_RUNS, gflops);
    printf("Sum (Serial):\t\t%4f\t%4f\n", t_serial/N_RUNS, gflops_serial);
    printf("Correctness check: %f (Serial: %f | SIMD: %f)\n", result_serial - result, result_serial, result);*/
  printf("%4f\n",t / 500);
  free(X);
  return 0;
}
