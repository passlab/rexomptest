#include "rex_kmp.h" 
//axpy.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <immintrin.h> 
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
  __m256 __vec76 = _mm256_set1_ps(a);
  __m256 __vec71 = _mm256_set1_ps(a);
  __m256 __vec66 = _mm256_set1_ps(a);
  __m256 __vec61 = _mm256_set1_ps(a);
  __m256 __vec56 = _mm256_set1_ps(a);
  __m256 __vec51 = _mm256_set1_ps(a);
  __m256 __vec46 = _mm256_set1_ps(a);
  __m256 __vec41 = _mm256_set1_ps(a);
  __m256 __vec36 = _mm256_set1_ps(a);
  __m256 __vec31 = _mm256_set1_ps(a);
  __m256 __vec26 = _mm256_set1_ps(a);
  __m256 __vec21 = _mm256_set1_ps(a);
  __m256 __vec16 = _mm256_set1_ps(a);
  __m256 __vec11 = _mm256_set1_ps(a);
  __m256 __vec6 = _mm256_set1_ps(a);
  __m256 __vec1 = _mm256_set1_ps(a);
  int i;
  for (i = 0; i <= 102399999; i += 16 * 8) {
    __m256 __vec0 = _mm256_loadu_ps(&Y[i]);
    __m256 __vec2 = _mm256_loadu_ps(&X[i]);
    __m256 __vec3 = _mm256_mul_ps(__vec2,__vec1);
    __m256 __vec4 = _mm256_add_ps(__vec3,__vec0);
    _mm256_storeu_ps(&Y[i],__vec4);
    __m256 __vec5 = _mm256_loadu_ps(&Y[i + 8 * 1]);
    __m256 __vec7 = _mm256_loadu_ps(&X[i + 8 * 1]);
    __m256 __vec8 = _mm256_mul_ps(__vec7,__vec6);
    __m256 __vec9 = _mm256_add_ps(__vec8,__vec5);
    _mm256_storeu_ps(&Y[i + 8 * 1],__vec9);
    __m256 __vec10 = _mm256_loadu_ps(&Y[i + 8 * 2]);
    __m256 __vec12 = _mm256_loadu_ps(&X[i + 8 * 2]);
    __m256 __vec13 = _mm256_mul_ps(__vec12,__vec11);
    __m256 __vec14 = _mm256_add_ps(__vec13,__vec10);
    _mm256_storeu_ps(&Y[i + 8 * 2],__vec14);
    __m256 __vec15 = _mm256_loadu_ps(&Y[i + 8 * 3]);
    __m256 __vec17 = _mm256_loadu_ps(&X[i + 8 * 3]);
    __m256 __vec18 = _mm256_mul_ps(__vec17,__vec16);
    __m256 __vec19 = _mm256_add_ps(__vec18,__vec15);
    _mm256_storeu_ps(&Y[i + 8 * 3],__vec19);
    __m256 __vec20 = _mm256_loadu_ps(&Y[i + 8 * 4]);
    __m256 __vec22 = _mm256_loadu_ps(&X[i + 8 * 4]);
    __m256 __vec23 = _mm256_mul_ps(__vec22,__vec21);
    __m256 __vec24 = _mm256_add_ps(__vec23,__vec20);
    _mm256_storeu_ps(&Y[i + 8 * 4],__vec24);
    __m256 __vec25 = _mm256_loadu_ps(&Y[i + 8 * 5]);
    __m256 __vec27 = _mm256_loadu_ps(&X[i + 8 * 5]);
    __m256 __vec28 = _mm256_mul_ps(__vec27,__vec26);
    __m256 __vec29 = _mm256_add_ps(__vec28,__vec25);
    _mm256_storeu_ps(&Y[i + 8 * 5],__vec29);
    __m256 __vec30 = _mm256_loadu_ps(&Y[i + 8 * 6]);
    __m256 __vec32 = _mm256_loadu_ps(&X[i + 8 * 6]);
    __m256 __vec33 = _mm256_mul_ps(__vec32,__vec31);
    __m256 __vec34 = _mm256_add_ps(__vec33,__vec30);
    _mm256_storeu_ps(&Y[i + 8 * 6],__vec34);
    __m256 __vec35 = _mm256_loadu_ps(&Y[i + 8 * 7]);
    __m256 __vec37 = _mm256_loadu_ps(&X[i + 8 * 7]);
    __m256 __vec38 = _mm256_mul_ps(__vec37,__vec36);
    __m256 __vec39 = _mm256_add_ps(__vec38,__vec35);
    _mm256_storeu_ps(&Y[i + 8 * 7],__vec39);
    __m256 __vec40 = _mm256_loadu_ps(&Y[i + 8 * 8]);
    __m256 __vec42 = _mm256_loadu_ps(&X[i + 8 * 8]);
    __m256 __vec43 = _mm256_mul_ps(__vec42,__vec41);
    __m256 __vec44 = _mm256_add_ps(__vec43,__vec40);
    _mm256_storeu_ps(&Y[i + 8 * 8],__vec44);
    __m256 __vec45 = _mm256_loadu_ps(&Y[i + 8 * 9]);
    __m256 __vec47 = _mm256_loadu_ps(&X[i + 8 * 9]);
    __m256 __vec48 = _mm256_mul_ps(__vec47,__vec46);
    __m256 __vec49 = _mm256_add_ps(__vec48,__vec45);
    _mm256_storeu_ps(&Y[i + 8 * 9],__vec49);
    __m256 __vec50 = _mm256_loadu_ps(&Y[i + 8 * 10]);
    __m256 __vec52 = _mm256_loadu_ps(&X[i + 8 * 10]);
    __m256 __vec53 = _mm256_mul_ps(__vec52,__vec51);
    __m256 __vec54 = _mm256_add_ps(__vec53,__vec50);
    _mm256_storeu_ps(&Y[i + 8 * 10],__vec54);
    __m256 __vec55 = _mm256_loadu_ps(&Y[i + 8 * 11]);
    __m256 __vec57 = _mm256_loadu_ps(&X[i + 8 * 11]);
    __m256 __vec58 = _mm256_mul_ps(__vec57,__vec56);
    __m256 __vec59 = _mm256_add_ps(__vec58,__vec55);
    _mm256_storeu_ps(&Y[i + 8 * 11],__vec59);
    __m256 __vec60 = _mm256_loadu_ps(&Y[i + 8 * 12]);
    __m256 __vec62 = _mm256_loadu_ps(&X[i + 8 * 12]);
    __m256 __vec63 = _mm256_mul_ps(__vec62,__vec61);
    __m256 __vec64 = _mm256_add_ps(__vec63,__vec60);
    _mm256_storeu_ps(&Y[i + 8 * 12],__vec64);
    __m256 __vec65 = _mm256_loadu_ps(&Y[i + 8 * 13]);
    __m256 __vec67 = _mm256_loadu_ps(&X[i + 8 * 13]);
    __m256 __vec68 = _mm256_mul_ps(__vec67,__vec66);
    __m256 __vec69 = _mm256_add_ps(__vec68,__vec65);
    _mm256_storeu_ps(&Y[i + 8 * 13],__vec69);
    __m256 __vec70 = _mm256_loadu_ps(&Y[i + 8 * 14]);
    __m256 __vec72 = _mm256_loadu_ps(&X[i + 8 * 14]);
    __m256 __vec73 = _mm256_mul_ps(__vec72,__vec71);
    __m256 __vec74 = _mm256_add_ps(__vec73,__vec70);
    _mm256_storeu_ps(&Y[i + 8 * 14],__vec74);
    __m256 __vec75 = _mm256_loadu_ps(&Y[i + 8 * 15]);
    __m256 __vec77 = _mm256_loadu_ps(&X[i + 8 * 15]);
    __m256 __vec78 = _mm256_mul_ps(__vec77,__vec76);
    __m256 __vec79 = _mm256_add_ps(__vec78,__vec75);
    _mm256_storeu_ps(&Y[i + 8 * 15],__vec79);
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
