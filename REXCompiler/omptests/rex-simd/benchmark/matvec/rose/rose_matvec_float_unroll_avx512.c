#include "rex_kmp.h" 
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <math.h>
#include <immintrin.h> 
#define N_RUNS 20
#define N 10240
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//Create a matrix and a vector and fill with random numbers

void init(float *matrix,float *vector)
{
  for (size_t i = 0; i < 10240; i++) {
    for (size_t j = 0; j < 10240; j++) {
      matrix[i * 10240 + j] = ((float )(rand())) / ((float )(2147483647 / 10.0));
    }
    vector[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
  }
}

void matvec_simd(float *matrix,float *vector,float *dest)
{
  for (size_t i = 0; i < 10240; i++) {
    float tmp = 0;
    size_t j = 0;
    __m512 __part0 = _mm512_setzero_ps();
    __m512 __part5 = _mm512_setzero_ps();
    __m512 __part10 = _mm512_setzero_ps();
    __m512 __part15 = _mm512_setzero_ps();
    __m512 __part20 = _mm512_setzero_ps();
    __m512 __part25 = _mm512_setzero_ps();
    __m512 __part30 = _mm512_setzero_ps();
    __m512 __part35 = _mm512_setzero_ps();
    for (j = 0; j <= ((unsigned long )10240) - 1; j += 8 * 16) {
      __m512 __vec1 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + j]);
      __m512 __vec2 = _mm512_loadu_ps(&vector[j]);
      __m512 __vec3 = _mm512_mul_ps(__vec2,__vec1);
      __m512 __vec4 = _mm512_add_ps(__vec3,__part0);
      __part0 = (__vec4);
      __m512 __vec6 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 16 * 1)]);
      __m512 __vec7 = _mm512_loadu_ps(&vector[j + 16 * 1]);
      __m512 __vec8 = _mm512_mul_ps(__vec7,__vec6);
      __m512 __vec9 = _mm512_add_ps(__vec8,__part5);
      __part5 = (__vec9);
      __m512 __vec11 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 16 * 2)]);
      __m512 __vec12 = _mm512_loadu_ps(&vector[j + 16 * 2]);
      __m512 __vec13 = _mm512_mul_ps(__vec12,__vec11);
      __m512 __vec14 = _mm512_add_ps(__vec13,__part10);
      __part10 = (__vec14);
      __m512 __vec16 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 16 * 3)]);
      __m512 __vec17 = _mm512_loadu_ps(&vector[j + 16 * 3]);
      __m512 __vec18 = _mm512_mul_ps(__vec17,__vec16);
      __m512 __vec19 = _mm512_add_ps(__vec18,__part15);
      __part15 = (__vec19);
      __m512 __vec21 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 16 * 4)]);
      __m512 __vec22 = _mm512_loadu_ps(&vector[j + 16 * 4]);
      __m512 __vec23 = _mm512_mul_ps(__vec22,__vec21);
      __m512 __vec24 = _mm512_add_ps(__vec23,__part20);
      __part20 = (__vec24);
      __m512 __vec26 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 16 * 5)]);
      __m512 __vec27 = _mm512_loadu_ps(&vector[j + 16 * 5]);
      __m512 __vec28 = _mm512_mul_ps(__vec27,__vec26);
      __m512 __vec29 = _mm512_add_ps(__vec28,__part25);
      __part25 = (__vec29);
      __m512 __vec31 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 16 * 6)]);
      __m512 __vec32 = _mm512_loadu_ps(&vector[j + 16 * 6]);
      __m512 __vec33 = _mm512_mul_ps(__vec32,__vec31);
      __m512 __vec34 = _mm512_add_ps(__vec33,__part30);
      __part30 = (__vec34);
      __m512 __vec36 = _mm512_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 16 * 7)]);
      __m512 __vec37 = _mm512_loadu_ps(&vector[j + 16 * 7]);
      __m512 __vec38 = _mm512_mul_ps(__vec37,__vec36);
      __m512 __vec39 = _mm512_add_ps(__vec38,__part35);
      __part35 = (__vec39);
    }
    __m256 __buf21 = _mm512_extractf32x8_ps(__part35,0);
    __m256 __buf22 = _mm512_extractf32x8_ps(__part35,1);
    __buf22 = _mm256_add_ps(__buf21,__buf22);
    __buf22 = _mm256_hadd_ps(__buf22,__buf22);
    __buf22 = _mm256_hadd_ps(__buf22,__buf22);
    float __buf23[8];
    _mm256_storeu_ps(&__buf23,__buf22);
    tmp += __buf23[0] + __buf23[6];
    __m256 __buf18 = _mm512_extractf32x8_ps(__part30,0);
    __m256 __buf19 = _mm512_extractf32x8_ps(__part30,1);
    __buf19 = _mm256_add_ps(__buf18,__buf19);
    __buf19 = _mm256_hadd_ps(__buf19,__buf19);
    __buf19 = _mm256_hadd_ps(__buf19,__buf19);
    float __buf20[8];
    _mm256_storeu_ps(&__buf20,__buf19);
    tmp += __buf20[0] + __buf20[6];
    __m256 __buf15 = _mm512_extractf32x8_ps(__part25,0);
    __m256 __buf16 = _mm512_extractf32x8_ps(__part25,1);
    __buf16 = _mm256_add_ps(__buf15,__buf16);
    __buf16 = _mm256_hadd_ps(__buf16,__buf16);
    __buf16 = _mm256_hadd_ps(__buf16,__buf16);
    float __buf17[8];
    _mm256_storeu_ps(&__buf17,__buf16);
    tmp += __buf17[0] + __buf17[6];
    __m256 __buf12 = _mm512_extractf32x8_ps(__part20,0);
    __m256 __buf13 = _mm512_extractf32x8_ps(__part20,1);
    __buf13 = _mm256_add_ps(__buf12,__buf13);
    __buf13 = _mm256_hadd_ps(__buf13,__buf13);
    __buf13 = _mm256_hadd_ps(__buf13,__buf13);
    float __buf14[8];
    _mm256_storeu_ps(&__buf14,__buf13);
    tmp += __buf14[0] + __buf14[6];
    __m256 __buf9 = _mm512_extractf32x8_ps(__part15,0);
    __m256 __buf10 = _mm512_extractf32x8_ps(__part15,1);
    __buf10 = _mm256_add_ps(__buf9,__buf10);
    __buf10 = _mm256_hadd_ps(__buf10,__buf10);
    __buf10 = _mm256_hadd_ps(__buf10,__buf10);
    float __buf11[8];
    _mm256_storeu_ps(&__buf11,__buf10);
    tmp += __buf11[0] + __buf11[6];
    __m256 __buf6 = _mm512_extractf32x8_ps(__part10,0);
    __m256 __buf7 = _mm512_extractf32x8_ps(__part10,1);
    __buf7 = _mm256_add_ps(__buf6,__buf7);
    __buf7 = _mm256_hadd_ps(__buf7,__buf7);
    __buf7 = _mm256_hadd_ps(__buf7,__buf7);
    float __buf8[8];
    _mm256_storeu_ps(&__buf8,__buf7);
    tmp += __buf8[0] + __buf8[6];
    __m256 __buf3 = _mm512_extractf32x8_ps(__part5,0);
    __m256 __buf4 = _mm512_extractf32x8_ps(__part5,1);
    __buf4 = _mm256_add_ps(__buf3,__buf4);
    __buf4 = _mm256_hadd_ps(__buf4,__buf4);
    __buf4 = _mm256_hadd_ps(__buf4,__buf4);
    float __buf5[8];
    _mm256_storeu_ps(&__buf5,__buf4);
    tmp += __buf5[0] + __buf5[6];
    __m256 __buf0 = _mm512_extractf32x8_ps(__part0,0);
    __m256 __buf1 = _mm512_extractf32x8_ps(__part0,1);
    __buf1 = _mm256_add_ps(__buf0,__buf1);
    __buf1 = _mm256_hadd_ps(__buf1,__buf1);
    __buf1 = _mm256_hadd_ps(__buf1,__buf1);
    float __buf2[8];
    _mm256_storeu_ps(&__buf2,__buf1);
    tmp += __buf2[0] + __buf2[6];
    dest[i] = tmp;
  }
}
// Debug functions

void matvec_serial(float *matrix,float *vector,float *dest)
{
  for (size_t i = 0; i < 10240; i++) {
    float tmp = 0;
    for (size_t j = 0; j < 10240; j++) {
      tmp += matrix[i * 10240 + j] * vector[j];
    }
    dest[i] = tmp;
  }
}

float check(float *A,float *B)
{
  float difference = 0;
  for (size_t i = 0; i < 10240; i++) {
    difference += fabsf(A[i] - B[i]);
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  float *dest_vector = (malloc(sizeof(float *) * 10240));
  float *serial_vector = (malloc(sizeof(float *) * 10240));
  float *matrix = (malloc(sizeof(float *) * 10240 * 10240));
  float *vector = (malloc(sizeof(float ) * 10240));
  srand((time(((void *)0))));
  init(matrix,vector);
//warming up
  matvec_simd(matrix,vector,dest_vector);
  double t = 0;
  double start = read_timer();
  for (int i = 0; i < 20; i++) {
    fprintf(stderr,"%d ",i);
    matvec_simd(matrix,vector,dest_vector);
    fprintf(stderr,"(%f,%f,%f)",dest_vector[0],dest_vector[10240 - 10],dest_vector[10240 / 10]);
  }
  fprintf(stderr,"\n");
  t += read_timer() - start;
  double t_serial = 0;
  double start_serial = read_timer();
  for (int i = 0; i < 20; i++) 
    matvec_serial(matrix,vector,serial_vector);
  t_serial += read_timer() - start_serial;
  double gflops = 2.0 * 10240 * 10240 * 20 / (1.0e9 * t);
  double gflops_serial = 2.0 * 10240 * 10240 * 20 / (1.0e9 * t_serial);
/*printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("Matrix-vector (SIMD):\t\t%4f\t%4f\n", t/N_RUNS, gflops);
    printf("Matrix-vector (Serial):\t\t%4f\t%4f\n", t_serial/N_RUNS, gflops_serial);
    printf("Correctness check: %f\n", check(dest_vector,serial_vector));*/
  printf("%4f\n",t / 20);
  free(dest_vector);
  free(serial_vector);
  free(matrix);
  free(vector);
  return 0;
}
