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
    __m256 __part0 = _mm256_setzero_ps();
    __m256 __part5 = _mm256_setzero_ps();
    __m256 __part10 = _mm256_setzero_ps();
    __m256 __part15 = _mm256_setzero_ps();
    __m256 __part20 = _mm256_setzero_ps();
    __m256 __part25 = _mm256_setzero_ps();
    __m256 __part30 = _mm256_setzero_ps();
    __m256 __part35 = _mm256_setzero_ps();
    __m256 __part40 = _mm256_setzero_ps();
    __m256 __part45 = _mm256_setzero_ps();
    __m256 __part50 = _mm256_setzero_ps();
    __m256 __part55 = _mm256_setzero_ps();
    __m256 __part60 = _mm256_setzero_ps();
    __m256 __part65 = _mm256_setzero_ps();
    __m256 __part70 = _mm256_setzero_ps();
    __m256 __part75 = _mm256_setzero_ps();
    for (j = 0; j <= ((unsigned long )10240) - 1; j += 16 * 8) {
      __m256 __vec1 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + j]);
      __m256 __vec2 = _mm256_loadu_ps(&vector[j]);
      __m256 __vec3 = _mm256_mul_ps(__vec2,__vec1);
      __m256 __vec4 = _mm256_add_ps(__vec3,__part0);
      __part0 = (__vec4);
      __m256 __vec6 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 1)]);
      __m256 __vec7 = _mm256_loadu_ps(&vector[j + 8 * 1]);
      __m256 __vec8 = _mm256_mul_ps(__vec7,__vec6);
      __m256 __vec9 = _mm256_add_ps(__vec8,__part5);
      __part5 = (__vec9);
      __m256 __vec11 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 2)]);
      __m256 __vec12 = _mm256_loadu_ps(&vector[j + 8 * 2]);
      __m256 __vec13 = _mm256_mul_ps(__vec12,__vec11);
      __m256 __vec14 = _mm256_add_ps(__vec13,__part10);
      __part10 = (__vec14);
      __m256 __vec16 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 3)]);
      __m256 __vec17 = _mm256_loadu_ps(&vector[j + 8 * 3]);
      __m256 __vec18 = _mm256_mul_ps(__vec17,__vec16);
      __m256 __vec19 = _mm256_add_ps(__vec18,__part15);
      __part15 = (__vec19);
      __m256 __vec21 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 4)]);
      __m256 __vec22 = _mm256_loadu_ps(&vector[j + 8 * 4]);
      __m256 __vec23 = _mm256_mul_ps(__vec22,__vec21);
      __m256 __vec24 = _mm256_add_ps(__vec23,__part20);
      __part20 = (__vec24);
      __m256 __vec26 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 5)]);
      __m256 __vec27 = _mm256_loadu_ps(&vector[j + 8 * 5]);
      __m256 __vec28 = _mm256_mul_ps(__vec27,__vec26);
      __m256 __vec29 = _mm256_add_ps(__vec28,__part25);
      __part25 = (__vec29);
      __m256 __vec31 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 6)]);
      __m256 __vec32 = _mm256_loadu_ps(&vector[j + 8 * 6]);
      __m256 __vec33 = _mm256_mul_ps(__vec32,__vec31);
      __m256 __vec34 = _mm256_add_ps(__vec33,__part30);
      __part30 = (__vec34);
      __m256 __vec36 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 7)]);
      __m256 __vec37 = _mm256_loadu_ps(&vector[j + 8 * 7]);
      __m256 __vec38 = _mm256_mul_ps(__vec37,__vec36);
      __m256 __vec39 = _mm256_add_ps(__vec38,__part35);
      __part35 = (__vec39);
      __m256 __vec41 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 8)]);
      __m256 __vec42 = _mm256_loadu_ps(&vector[j + 8 * 8]);
      __m256 __vec43 = _mm256_mul_ps(__vec42,__vec41);
      __m256 __vec44 = _mm256_add_ps(__vec43,__part40);
      __part40 = (__vec44);
      __m256 __vec46 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 9)]);
      __m256 __vec47 = _mm256_loadu_ps(&vector[j + 8 * 9]);
      __m256 __vec48 = _mm256_mul_ps(__vec47,__vec46);
      __m256 __vec49 = _mm256_add_ps(__vec48,__part45);
      __part45 = (__vec49);
      __m256 __vec51 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 10)]);
      __m256 __vec52 = _mm256_loadu_ps(&vector[j + 8 * 10]);
      __m256 __vec53 = _mm256_mul_ps(__vec52,__vec51);
      __m256 __vec54 = _mm256_add_ps(__vec53,__part50);
      __part50 = (__vec54);
      __m256 __vec56 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 11)]);
      __m256 __vec57 = _mm256_loadu_ps(&vector[j + 8 * 11]);
      __m256 __vec58 = _mm256_mul_ps(__vec57,__vec56);
      __m256 __vec59 = _mm256_add_ps(__vec58,__part55);
      __part55 = (__vec59);
      __m256 __vec61 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 12)]);
      __m256 __vec62 = _mm256_loadu_ps(&vector[j + 8 * 12]);
      __m256 __vec63 = _mm256_mul_ps(__vec62,__vec61);
      __m256 __vec64 = _mm256_add_ps(__vec63,__part60);
      __part60 = (__vec64);
      __m256 __vec66 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 13)]);
      __m256 __vec67 = _mm256_loadu_ps(&vector[j + 8 * 13]);
      __m256 __vec68 = _mm256_mul_ps(__vec67,__vec66);
      __m256 __vec69 = _mm256_add_ps(__vec68,__part65);
      __part65 = (__vec69);
      __m256 __vec71 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 14)]);
      __m256 __vec72 = _mm256_loadu_ps(&vector[j + 8 * 14]);
      __m256 __vec73 = _mm256_mul_ps(__vec72,__vec71);
      __m256 __vec74 = _mm256_add_ps(__vec73,__part70);
      __part70 = (__vec74);
      __m256 __vec76 = _mm256_loadu_ps(&matrix[i * ((unsigned long )10240) + (j + 8 * 15)]);
      __m256 __vec77 = _mm256_loadu_ps(&vector[j + 8 * 15]);
      __m256 __vec78 = _mm256_mul_ps(__vec77,__vec76);
      __m256 __vec79 = _mm256_add_ps(__vec78,__part75);
      __part75 = (__vec79);
    }
    __m256 __buf46 = __part75;
    __buf46 = _mm256_hadd_ps(__buf46,__buf46);
    __buf46 = _mm256_hadd_ps(__buf46,__buf46);
    float __buf47[8];
    _mm256_storeu_ps(&__buf47,__buf46);
    tmp += __buf47[0] + __buf47[6];
    __m256 __buf43 = __part70;
    __buf43 = _mm256_hadd_ps(__buf43,__buf43);
    __buf43 = _mm256_hadd_ps(__buf43,__buf43);
    float __buf44[8];
    _mm256_storeu_ps(&__buf44,__buf43);
    tmp += __buf44[0] + __buf44[6];
    __m256 __buf40 = __part65;
    __buf40 = _mm256_hadd_ps(__buf40,__buf40);
    __buf40 = _mm256_hadd_ps(__buf40,__buf40);
    float __buf41[8];
    _mm256_storeu_ps(&__buf41,__buf40);
    tmp += __buf41[0] + __buf41[6];
    __m256 __buf37 = __part60;
    __buf37 = _mm256_hadd_ps(__buf37,__buf37);
    __buf37 = _mm256_hadd_ps(__buf37,__buf37);
    float __buf38[8];
    _mm256_storeu_ps(&__buf38,__buf37);
    tmp += __buf38[0] + __buf38[6];
    __m256 __buf34 = __part55;
    __buf34 = _mm256_hadd_ps(__buf34,__buf34);
    __buf34 = _mm256_hadd_ps(__buf34,__buf34);
    float __buf35[8];
    _mm256_storeu_ps(&__buf35,__buf34);
    tmp += __buf35[0] + __buf35[6];
    __m256 __buf31 = __part50;
    __buf31 = _mm256_hadd_ps(__buf31,__buf31);
    __buf31 = _mm256_hadd_ps(__buf31,__buf31);
    float __buf32[8];
    _mm256_storeu_ps(&__buf32,__buf31);
    tmp += __buf32[0] + __buf32[6];
    __m256 __buf28 = __part45;
    __buf28 = _mm256_hadd_ps(__buf28,__buf28);
    __buf28 = _mm256_hadd_ps(__buf28,__buf28);
    float __buf29[8];
    _mm256_storeu_ps(&__buf29,__buf28);
    tmp += __buf29[0] + __buf29[6];
    __m256 __buf25 = __part40;
    __buf25 = _mm256_hadd_ps(__buf25,__buf25);
    __buf25 = _mm256_hadd_ps(__buf25,__buf25);
    float __buf26[8];
    _mm256_storeu_ps(&__buf26,__buf25);
    tmp += __buf26[0] + __buf26[6];
    __m256 __buf22 = __part35;
    __buf22 = _mm256_hadd_ps(__buf22,__buf22);
    __buf22 = _mm256_hadd_ps(__buf22,__buf22);
    float __buf23[8];
    _mm256_storeu_ps(&__buf23,__buf22);
    tmp += __buf23[0] + __buf23[6];
    __m256 __buf19 = __part30;
    __buf19 = _mm256_hadd_ps(__buf19,__buf19);
    __buf19 = _mm256_hadd_ps(__buf19,__buf19);
    float __buf20[8];
    _mm256_storeu_ps(&__buf20,__buf19);
    tmp += __buf20[0] + __buf20[6];
    __m256 __buf16 = __part25;
    __buf16 = _mm256_hadd_ps(__buf16,__buf16);
    __buf16 = _mm256_hadd_ps(__buf16,__buf16);
    float __buf17[8];
    _mm256_storeu_ps(&__buf17,__buf16);
    tmp += __buf17[0] + __buf17[6];
    __m256 __buf13 = __part20;
    __buf13 = _mm256_hadd_ps(__buf13,__buf13);
    __buf13 = _mm256_hadd_ps(__buf13,__buf13);
    float __buf14[8];
    _mm256_storeu_ps(&__buf14,__buf13);
    tmp += __buf14[0] + __buf14[6];
    __m256 __buf10 = __part15;
    __buf10 = _mm256_hadd_ps(__buf10,__buf10);
    __buf10 = _mm256_hadd_ps(__buf10,__buf10);
    float __buf11[8];
    _mm256_storeu_ps(&__buf11,__buf10);
    tmp += __buf11[0] + __buf11[6];
    __m256 __buf7 = __part10;
    __buf7 = _mm256_hadd_ps(__buf7,__buf7);
    __buf7 = _mm256_hadd_ps(__buf7,__buf7);
    float __buf8[8];
    _mm256_storeu_ps(&__buf8,__buf7);
    tmp += __buf8[0] + __buf8[6];
    __m256 __buf4 = __part5;
    __buf4 = _mm256_hadd_ps(__buf4,__buf4);
    __buf4 = _mm256_hadd_ps(__buf4,__buf4);
    float __buf5[8];
    _mm256_storeu_ps(&__buf5,__buf4);
    tmp += __buf5[0] + __buf5[6];
    __m256 __buf1 = __part0;
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
