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
      temp = 0;
      size_t k = 0;
      svbool_t __pg0 = svwhilelt_b32((unsigned long )0,((unsigned long )1024) - 1);
      svfloat32_t __part0 = svdup_f32(0.00000L);
      svfloat32_t __part7 = svdup_f32(0.00000L);
      svfloat32_t __part14 = svdup_f32(0.00000L);
      svfloat32_t __part21 = svdup_f32(0.00000L);
      svfloat32_t __part28 = svdup_f32(0.00000L);
      svfloat32_t __part35 = svdup_f32(0.00000L);
      svfloat32_t __part42 = svdup_f32(0.00000L);
      svfloat32_t __part49 = svdup_f32(0.00000L);
      svfloat32_t __part56 = svdup_f32(0.00000L);
      svfloat32_t __part63 = svdup_f32(0.00000L);
      svfloat32_t __part70 = svdup_f32(0.00000L);
      svfloat32_t __part77 = svdup_f32(0.00000L);
      svfloat32_t __part84 = svdup_f32(0.00000L);
      svfloat32_t __part91 = svdup_f32(0.00000L);
      svfloat32_t __part98 = svdup_f32(0.00000L);
      svfloat32_t __part105 = svdup_f32(0.00000L);
      for (k = 0; k <= ((unsigned long )1024) - 1; k += 16 * svcntw()) {
        float *__ptr1 = A[i];
        svfloat32_t __vec2 = svld1(__pg0,&__ptr1[k]);
        float *__ptr3 = B[j];
        svfloat32_t __vec4 = svld1(__pg0,&__ptr3[k]);
        svfloat32_t __vec5 = svmul_f32_m(__pg0,__vec4,__vec2);
        svfloat32_t __vec6 = svadd_f32_m(__pg0,__vec5,__part0);
        __part0 = (__vec6);
        float *__ptr8 = A[i];
        svfloat32_t __vec9 = svld1(__pg0,&__ptr8[k + svcntw() * 1]);
        float *__ptr10 = B[j];
        svfloat32_t __vec11 = svld1(__pg0,&__ptr10[k + svcntw() * 1]);
        svfloat32_t __vec12 = svmul_f32_m(__pg0,__vec11,__vec9);
        svfloat32_t __vec13 = svadd_f32_m(__pg0,__vec12,__part7);
        __part7 = (__vec13);
        float *__ptr15 = A[i];
        svfloat32_t __vec16 = svld1(__pg0,&__ptr15[k + svcntw() * 2]);
        float *__ptr17 = B[j];
        svfloat32_t __vec18 = svld1(__pg0,&__ptr17[k + svcntw() * 2]);
        svfloat32_t __vec19 = svmul_f32_m(__pg0,__vec18,__vec16);
        svfloat32_t __vec20 = svadd_f32_m(__pg0,__vec19,__part14);
        __part14 = (__vec20);
        float *__ptr22 = A[i];
        svfloat32_t __vec23 = svld1(__pg0,&__ptr22[k + svcntw() * 3]);
        float *__ptr24 = B[j];
        svfloat32_t __vec25 = svld1(__pg0,&__ptr24[k + svcntw() * 3]);
        svfloat32_t __vec26 = svmul_f32_m(__pg0,__vec25,__vec23);
        svfloat32_t __vec27 = svadd_f32_m(__pg0,__vec26,__part21);
        __part21 = (__vec27);
        float *__ptr29 = A[i];
        svfloat32_t __vec30 = svld1(__pg0,&__ptr29[k + svcntw() * 4]);
        float *__ptr31 = B[j];
        svfloat32_t __vec32 = svld1(__pg0,&__ptr31[k + svcntw() * 4]);
        svfloat32_t __vec33 = svmul_f32_m(__pg0,__vec32,__vec30);
        svfloat32_t __vec34 = svadd_f32_m(__pg0,__vec33,__part28);
        __part28 = (__vec34);
        float *__ptr36 = A[i];
        svfloat32_t __vec37 = svld1(__pg0,&__ptr36[k + svcntw() * 5]);
        float *__ptr38 = B[j];
        svfloat32_t __vec39 = svld1(__pg0,&__ptr38[k + svcntw() * 5]);
        svfloat32_t __vec40 = svmul_f32_m(__pg0,__vec39,__vec37);
        svfloat32_t __vec41 = svadd_f32_m(__pg0,__vec40,__part35);
        __part35 = (__vec41);
        float *__ptr43 = A[i];
        svfloat32_t __vec44 = svld1(__pg0,&__ptr43[k + svcntw() * 6]);
        float *__ptr45 = B[j];
        svfloat32_t __vec46 = svld1(__pg0,&__ptr45[k + svcntw() * 6]);
        svfloat32_t __vec47 = svmul_f32_m(__pg0,__vec46,__vec44);
        svfloat32_t __vec48 = svadd_f32_m(__pg0,__vec47,__part42);
        __part42 = (__vec48);
        float *__ptr50 = A[i];
        svfloat32_t __vec51 = svld1(__pg0,&__ptr50[k + svcntw() * 7]);
        float *__ptr52 = B[j];
        svfloat32_t __vec53 = svld1(__pg0,&__ptr52[k + svcntw() * 7]);
        svfloat32_t __vec54 = svmul_f32_m(__pg0,__vec53,__vec51);
        svfloat32_t __vec55 = svadd_f32_m(__pg0,__vec54,__part49);
        __part49 = (__vec55);
        float *__ptr57 = A[i];
        svfloat32_t __vec58 = svld1(__pg0,&__ptr57[k + svcntw() * 8]);
        float *__ptr59 = B[j];
        svfloat32_t __vec60 = svld1(__pg0,&__ptr59[k + svcntw() * 8]);
        svfloat32_t __vec61 = svmul_f32_m(__pg0,__vec60,__vec58);
        svfloat32_t __vec62 = svadd_f32_m(__pg0,__vec61,__part56);
        __part56 = (__vec62);
        float *__ptr64 = A[i];
        svfloat32_t __vec65 = svld1(__pg0,&__ptr64[k + svcntw() * 9]);
        float *__ptr66 = B[j];
        svfloat32_t __vec67 = svld1(__pg0,&__ptr66[k + svcntw() * 9]);
        svfloat32_t __vec68 = svmul_f32_m(__pg0,__vec67,__vec65);
        svfloat32_t __vec69 = svadd_f32_m(__pg0,__vec68,__part63);
        __part63 = (__vec69);
        float *__ptr71 = A[i];
        svfloat32_t __vec72 = svld1(__pg0,&__ptr71[k + svcntw() * 10]);
        float *__ptr73 = B[j];
        svfloat32_t __vec74 = svld1(__pg0,&__ptr73[k + svcntw() * 10]);
        svfloat32_t __vec75 = svmul_f32_m(__pg0,__vec74,__vec72);
        svfloat32_t __vec76 = svadd_f32_m(__pg0,__vec75,__part70);
        __part70 = (__vec76);
        float *__ptr78 = A[i];
        svfloat32_t __vec79 = svld1(__pg0,&__ptr78[k + svcntw() * 11]);
        float *__ptr80 = B[j];
        svfloat32_t __vec81 = svld1(__pg0,&__ptr80[k + svcntw() * 11]);
        svfloat32_t __vec82 = svmul_f32_m(__pg0,__vec81,__vec79);
        svfloat32_t __vec83 = svadd_f32_m(__pg0,__vec82,__part77);
        __part77 = (__vec83);
        float *__ptr85 = A[i];
        svfloat32_t __vec86 = svld1(__pg0,&__ptr85[k + svcntw() * 12]);
        float *__ptr87 = B[j];
        svfloat32_t __vec88 = svld1(__pg0,&__ptr87[k + svcntw() * 12]);
        svfloat32_t __vec89 = svmul_f32_m(__pg0,__vec88,__vec86);
        svfloat32_t __vec90 = svadd_f32_m(__pg0,__vec89,__part84);
        __part84 = (__vec90);
        float *__ptr92 = A[i];
        svfloat32_t __vec93 = svld1(__pg0,&__ptr92[k + svcntw() * 13]);
        float *__ptr94 = B[j];
        svfloat32_t __vec95 = svld1(__pg0,&__ptr94[k + svcntw() * 13]);
        svfloat32_t __vec96 = svmul_f32_m(__pg0,__vec95,__vec93);
        svfloat32_t __vec97 = svadd_f32_m(__pg0,__vec96,__part91);
        __part91 = (__vec97);
        float *__ptr99 = A[i];
        svfloat32_t __vec100 = svld1(__pg0,&__ptr99[k + svcntw() * 14]);
        float *__ptr101 = B[j];
        svfloat32_t __vec102 = svld1(__pg0,&__ptr101[k + svcntw() * 14]);
        svfloat32_t __vec103 = svmul_f32_m(__pg0,__vec102,__vec100);
        svfloat32_t __vec104 = svadd_f32_m(__pg0,__vec103,__part98);
        __part98 = (__vec104);
        float *__ptr106 = A[i];
        svfloat32_t __vec107 = svld1(__pg0,&__ptr106[k + svcntw() * 15]);
        float *__ptr108 = B[j];
        svfloat32_t __vec109 = svld1(__pg0,&__ptr108[k + svcntw() * 15]);
        svfloat32_t __vec110 = svmul_f32_m(__pg0,__vec109,__vec107);
        svfloat32_t __vec111 = svadd_f32_m(__pg0,__vec110,__part105);
        __part105 = (__vec111);
        __pg0 = svwhilelt_b32(k,((unsigned long )1024) - 1);
      }
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part105);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part98);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part91);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part84);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part77);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part70);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part63);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part56);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part49);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part42);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part35);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part28);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part21);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part14);
      __pg0 = svptrue_b32();
      temp += svaddv(__pg0,__part7);
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
