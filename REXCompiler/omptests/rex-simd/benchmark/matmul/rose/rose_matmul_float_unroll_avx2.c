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
      __m256 __part0 = _mm256_setzero_ps();
      __m256 __part7 = _mm256_setzero_ps();
      __m256 __part14 = _mm256_setzero_ps();
      __m256 __part21 = _mm256_setzero_ps();
      __m256 __part28 = _mm256_setzero_ps();
      __m256 __part35 = _mm256_setzero_ps();
      __m256 __part42 = _mm256_setzero_ps();
      __m256 __part49 = _mm256_setzero_ps();
      __m256 __part56 = _mm256_setzero_ps();
      __m256 __part63 = _mm256_setzero_ps();
      __m256 __part70 = _mm256_setzero_ps();
      __m256 __part77 = _mm256_setzero_ps();
      __m256 __part84 = _mm256_setzero_ps();
      __m256 __part91 = _mm256_setzero_ps();
      __m256 __part98 = _mm256_setzero_ps();
      __m256 __part105 = _mm256_setzero_ps();
      for (k = 0; k <= ((unsigned long )1024) - 1; k += 16 * 8) {
        float *__ptr1 = A[i];
        __m256 __vec2 = _mm256_loadu_ps(&__ptr1[k]);
        float *__ptr3 = B[j];
        __m256 __vec4 = _mm256_loadu_ps(&__ptr3[k]);
        __m256 __vec5 = _mm256_mul_ps(__vec4,__vec2);
        __m256 __vec6 = _mm256_add_ps(__vec5,__part0);
        __part0 = (__vec6);
        float *__ptr8 = A[i];
        __m256 __vec9 = _mm256_loadu_ps(&__ptr8[k + 8 * 1]);
        float *__ptr10 = B[j];
        __m256 __vec11 = _mm256_loadu_ps(&__ptr10[k + 8 * 1]);
        __m256 __vec12 = _mm256_mul_ps(__vec11,__vec9);
        __m256 __vec13 = _mm256_add_ps(__vec12,__part7);
        __part7 = (__vec13);
        float *__ptr15 = A[i];
        __m256 __vec16 = _mm256_loadu_ps(&__ptr15[k + 8 * 2]);
        float *__ptr17 = B[j];
        __m256 __vec18 = _mm256_loadu_ps(&__ptr17[k + 8 * 2]);
        __m256 __vec19 = _mm256_mul_ps(__vec18,__vec16);
        __m256 __vec20 = _mm256_add_ps(__vec19,__part14);
        __part14 = (__vec20);
        float *__ptr22 = A[i];
        __m256 __vec23 = _mm256_loadu_ps(&__ptr22[k + 8 * 3]);
        float *__ptr24 = B[j];
        __m256 __vec25 = _mm256_loadu_ps(&__ptr24[k + 8 * 3]);
        __m256 __vec26 = _mm256_mul_ps(__vec25,__vec23);
        __m256 __vec27 = _mm256_add_ps(__vec26,__part21);
        __part21 = (__vec27);
        float *__ptr29 = A[i];
        __m256 __vec30 = _mm256_loadu_ps(&__ptr29[k + 8 * 4]);
        float *__ptr31 = B[j];
        __m256 __vec32 = _mm256_loadu_ps(&__ptr31[k + 8 * 4]);
        __m256 __vec33 = _mm256_mul_ps(__vec32,__vec30);
        __m256 __vec34 = _mm256_add_ps(__vec33,__part28);
        __part28 = (__vec34);
        float *__ptr36 = A[i];
        __m256 __vec37 = _mm256_loadu_ps(&__ptr36[k + 8 * 5]);
        float *__ptr38 = B[j];
        __m256 __vec39 = _mm256_loadu_ps(&__ptr38[k + 8 * 5]);
        __m256 __vec40 = _mm256_mul_ps(__vec39,__vec37);
        __m256 __vec41 = _mm256_add_ps(__vec40,__part35);
        __part35 = (__vec41);
        float *__ptr43 = A[i];
        __m256 __vec44 = _mm256_loadu_ps(&__ptr43[k + 8 * 6]);
        float *__ptr45 = B[j];
        __m256 __vec46 = _mm256_loadu_ps(&__ptr45[k + 8 * 6]);
        __m256 __vec47 = _mm256_mul_ps(__vec46,__vec44);
        __m256 __vec48 = _mm256_add_ps(__vec47,__part42);
        __part42 = (__vec48);
        float *__ptr50 = A[i];
        __m256 __vec51 = _mm256_loadu_ps(&__ptr50[k + 8 * 7]);
        float *__ptr52 = B[j];
        __m256 __vec53 = _mm256_loadu_ps(&__ptr52[k + 8 * 7]);
        __m256 __vec54 = _mm256_mul_ps(__vec53,__vec51);
        __m256 __vec55 = _mm256_add_ps(__vec54,__part49);
        __part49 = (__vec55);
        float *__ptr57 = A[i];
        __m256 __vec58 = _mm256_loadu_ps(&__ptr57[k + 8 * 8]);
        float *__ptr59 = B[j];
        __m256 __vec60 = _mm256_loadu_ps(&__ptr59[k + 8 * 8]);
        __m256 __vec61 = _mm256_mul_ps(__vec60,__vec58);
        __m256 __vec62 = _mm256_add_ps(__vec61,__part56);
        __part56 = (__vec62);
        float *__ptr64 = A[i];
        __m256 __vec65 = _mm256_loadu_ps(&__ptr64[k + 8 * 9]);
        float *__ptr66 = B[j];
        __m256 __vec67 = _mm256_loadu_ps(&__ptr66[k + 8 * 9]);
        __m256 __vec68 = _mm256_mul_ps(__vec67,__vec65);
        __m256 __vec69 = _mm256_add_ps(__vec68,__part63);
        __part63 = (__vec69);
        float *__ptr71 = A[i];
        __m256 __vec72 = _mm256_loadu_ps(&__ptr71[k + 8 * 10]);
        float *__ptr73 = B[j];
        __m256 __vec74 = _mm256_loadu_ps(&__ptr73[k + 8 * 10]);
        __m256 __vec75 = _mm256_mul_ps(__vec74,__vec72);
        __m256 __vec76 = _mm256_add_ps(__vec75,__part70);
        __part70 = (__vec76);
        float *__ptr78 = A[i];
        __m256 __vec79 = _mm256_loadu_ps(&__ptr78[k + 8 * 11]);
        float *__ptr80 = B[j];
        __m256 __vec81 = _mm256_loadu_ps(&__ptr80[k + 8 * 11]);
        __m256 __vec82 = _mm256_mul_ps(__vec81,__vec79);
        __m256 __vec83 = _mm256_add_ps(__vec82,__part77);
        __part77 = (__vec83);
        float *__ptr85 = A[i];
        __m256 __vec86 = _mm256_loadu_ps(&__ptr85[k + 8 * 12]);
        float *__ptr87 = B[j];
        __m256 __vec88 = _mm256_loadu_ps(&__ptr87[k + 8 * 12]);
        __m256 __vec89 = _mm256_mul_ps(__vec88,__vec86);
        __m256 __vec90 = _mm256_add_ps(__vec89,__part84);
        __part84 = (__vec90);
        float *__ptr92 = A[i];
        __m256 __vec93 = _mm256_loadu_ps(&__ptr92[k + 8 * 13]);
        float *__ptr94 = B[j];
        __m256 __vec95 = _mm256_loadu_ps(&__ptr94[k + 8 * 13]);
        __m256 __vec96 = _mm256_mul_ps(__vec95,__vec93);
        __m256 __vec97 = _mm256_add_ps(__vec96,__part91);
        __part91 = (__vec97);
        float *__ptr99 = A[i];
        __m256 __vec100 = _mm256_loadu_ps(&__ptr99[k + 8 * 14]);
        float *__ptr101 = B[j];
        __m256 __vec102 = _mm256_loadu_ps(&__ptr101[k + 8 * 14]);
        __m256 __vec103 = _mm256_mul_ps(__vec102,__vec100);
        __m256 __vec104 = _mm256_add_ps(__vec103,__part98);
        __part98 = (__vec104);
        float *__ptr106 = A[i];
        __m256 __vec107 = _mm256_loadu_ps(&__ptr106[k + 8 * 15]);
        float *__ptr108 = B[j];
        __m256 __vec109 = _mm256_loadu_ps(&__ptr108[k + 8 * 15]);
        __m256 __vec110 = _mm256_mul_ps(__vec109,__vec107);
        __m256 __vec111 = _mm256_add_ps(__vec110,__part105);
        __part105 = (__vec111);
      }
      __m256 __buf46 = __part105;
      __buf46 = _mm256_hadd_ps(__buf46,__buf46);
      __buf46 = _mm256_hadd_ps(__buf46,__buf46);
      float __buf47[8];
      _mm256_storeu_ps(&__buf47,__buf46);
      temp += __buf47[0] + __buf47[6];
      __m256 __buf43 = __part98;
      __buf43 = _mm256_hadd_ps(__buf43,__buf43);
      __buf43 = _mm256_hadd_ps(__buf43,__buf43);
      float __buf44[8];
      _mm256_storeu_ps(&__buf44,__buf43);
      temp += __buf44[0] + __buf44[6];
      __m256 __buf40 = __part91;
      __buf40 = _mm256_hadd_ps(__buf40,__buf40);
      __buf40 = _mm256_hadd_ps(__buf40,__buf40);
      float __buf41[8];
      _mm256_storeu_ps(&__buf41,__buf40);
      temp += __buf41[0] + __buf41[6];
      __m256 __buf37 = __part84;
      __buf37 = _mm256_hadd_ps(__buf37,__buf37);
      __buf37 = _mm256_hadd_ps(__buf37,__buf37);
      float __buf38[8];
      _mm256_storeu_ps(&__buf38,__buf37);
      temp += __buf38[0] + __buf38[6];
      __m256 __buf34 = __part77;
      __buf34 = _mm256_hadd_ps(__buf34,__buf34);
      __buf34 = _mm256_hadd_ps(__buf34,__buf34);
      float __buf35[8];
      _mm256_storeu_ps(&__buf35,__buf34);
      temp += __buf35[0] + __buf35[6];
      __m256 __buf31 = __part70;
      __buf31 = _mm256_hadd_ps(__buf31,__buf31);
      __buf31 = _mm256_hadd_ps(__buf31,__buf31);
      float __buf32[8];
      _mm256_storeu_ps(&__buf32,__buf31);
      temp += __buf32[0] + __buf32[6];
      __m256 __buf28 = __part63;
      __buf28 = _mm256_hadd_ps(__buf28,__buf28);
      __buf28 = _mm256_hadd_ps(__buf28,__buf28);
      float __buf29[8];
      _mm256_storeu_ps(&__buf29,__buf28);
      temp += __buf29[0] + __buf29[6];
      __m256 __buf25 = __part56;
      __buf25 = _mm256_hadd_ps(__buf25,__buf25);
      __buf25 = _mm256_hadd_ps(__buf25,__buf25);
      float __buf26[8];
      _mm256_storeu_ps(&__buf26,__buf25);
      temp += __buf26[0] + __buf26[6];
      __m256 __buf22 = __part49;
      __buf22 = _mm256_hadd_ps(__buf22,__buf22);
      __buf22 = _mm256_hadd_ps(__buf22,__buf22);
      float __buf23[8];
      _mm256_storeu_ps(&__buf23,__buf22);
      temp += __buf23[0] + __buf23[6];
      __m256 __buf19 = __part42;
      __buf19 = _mm256_hadd_ps(__buf19,__buf19);
      __buf19 = _mm256_hadd_ps(__buf19,__buf19);
      float __buf20[8];
      _mm256_storeu_ps(&__buf20,__buf19);
      temp += __buf20[0] + __buf20[6];
      __m256 __buf16 = __part35;
      __buf16 = _mm256_hadd_ps(__buf16,__buf16);
      __buf16 = _mm256_hadd_ps(__buf16,__buf16);
      float __buf17[8];
      _mm256_storeu_ps(&__buf17,__buf16);
      temp += __buf17[0] + __buf17[6];
      __m256 __buf13 = __part28;
      __buf13 = _mm256_hadd_ps(__buf13,__buf13);
      __buf13 = _mm256_hadd_ps(__buf13,__buf13);
      float __buf14[8];
      _mm256_storeu_ps(&__buf14,__buf13);
      temp += __buf14[0] + __buf14[6];
      __m256 __buf10 = __part21;
      __buf10 = _mm256_hadd_ps(__buf10,__buf10);
      __buf10 = _mm256_hadd_ps(__buf10,__buf10);
      float __buf11[8];
      _mm256_storeu_ps(&__buf11,__buf10);
      temp += __buf11[0] + __buf11[6];
      __m256 __buf7 = __part14;
      __buf7 = _mm256_hadd_ps(__buf7,__buf7);
      __buf7 = _mm256_hadd_ps(__buf7,__buf7);
      float __buf8[8];
      _mm256_storeu_ps(&__buf8,__buf7);
      temp += __buf8[0] + __buf8[6];
      __m256 __buf4 = __part7;
      __buf4 = _mm256_hadd_ps(__buf4,__buf4);
      __buf4 = _mm256_hadd_ps(__buf4,__buf4);
      float __buf5[8];
      _mm256_storeu_ps(&__buf5,__buf4);
      temp += __buf5[0] + __buf5[6];
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
