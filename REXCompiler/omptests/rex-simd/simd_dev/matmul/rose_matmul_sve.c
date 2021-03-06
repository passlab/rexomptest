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
#define N 512
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
  int i;
  int j;
  for (i = 0; i < 512; i++) {
    for (j = 0; j < 512; j++) {
      A[i][j] = ((float )(rand())) / ((float )(2147483647 / 10.0));
    }
  }
}

void matmul_simd(float **A,float **B,float **C)
{
  int i;
  int j;
  int k;
  float temp;
  for (i = 0; i < 512; i++) {
    for (j = 0; j < 512; j++) {
      temp = 0;
      svbool_t __pg0 = svwhilelt_b32(0,511);
      svfloat32_t __vec0 = svdup_f32(temp);
      svfloat32_t __part7 = svdup_f32(0.00000L);
      for (k = 0; k <= 511; k += svcntw()) {
        float *__ptr1 = A[i];
        svfloat32_t __vec2 = svld1(__pg0,&__ptr1[k]);
        float *__ptr3 = B[j];
        svfloat32_t __vec4 = svld1(__pg0,&__ptr3[k]);
        svfloat32_t __vec5 = svmul_f32_m(__pg0,__vec4,__vec2);
        svfloat32_t __vec6 = svadd_f32_m(__pg0,__vec5,__vec0);
        __part7 = svadd_f32_m(__pg0,__part7,__vec6);
        __pg0 = svwhilelt_b32(k,511);
      }
      float __buf0[(svcntw())];
      __pg0 = svwhilelt_b32((uint64_t )0,(svcntw()));
      svst1(__pg0,&__buf0,__part7);
      for (int __i = 0; __i < svcntw(); ++__i) 
        temp += __buf0[__i];
      C[i][j] = temp;
    }
  }
}
// Debug functions

void print_matrix(float **matrix)
{
  for (int i = 0; i < 8; i++) {
    printf("[");
    for (int j = 0; j < 8; j++) {
      printf("%.2f ",matrix[i][j]);
    }
    puts("]");
  }
  puts("");
}

void matmul_serial(float **A,float **B,float **C)
{
  int i;
  int j;
  int k;
  float temp;
  for (i = 0; i < 512; i++) {
    for (j = 0; j < 512; j++) {
      temp = 0;
      for (k = 0; k < 512; k++) {
        temp += A[i][k] * B[j][k];
      }
      C[i][j] = temp;
    }
  }
}

float check(float **A,float **B)
{
  float difference = 0;
  for (int i = 0; i < 512; i++) {
    for (int j = 0; j < 512; j++) {
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
  float **A = (malloc(sizeof(float *) * 512));
  float **B = (malloc(sizeof(float *) * 512));
  float **C_simd = (malloc(sizeof(float *) * 512));
  float **C_serial = (malloc(sizeof(float *) * 512));
  float **BT = (malloc(sizeof(float *) * 512));
  for (int i = 0; i < 512; i++) {
    A[i] = (malloc(sizeof(float ) * 512));
    B[i] = (malloc(sizeof(float ) * 512));
    C_simd[i] = (malloc(sizeof(float ) * 512));
    C_serial[i] = (malloc(sizeof(float ) * 512));
    BT[i] = (malloc(sizeof(float ) * 512));
  }
  srand((time(((void *)0))));
  init(A);
  init(B);
  for (int line = 0; line < 512; line++) {
    for (int col = 0; col < 512; col++) {
      BT[line][col] = B[col][line];
    }
  }
  int i;
  int num_runs = 10;
  double elapsed = read_timer();
  for (i = 0; i < num_runs; i++) 
    matmul_simd(A,BT,C_simd);
  elapsed = read_timer() - elapsed;
  double elapsed_serial = read_timer();
  for (i = 0; i < num_runs; i++) 
    matmul_serial(A,BT,C_serial);
  elapsed_serial = read_timer() - elapsed_serial;
  print_matrix(A);
  print_matrix(BT);
  puts("=\n");
  print_matrix(C_simd);
  puts("---------------------------------");
  print_matrix(C_serial);
  double gflops_omp = 2.0 * 512 * 512 * 512 * num_runs / (1.0e9 * elapsed);
  double gflops_serial = 2.0 * 512 * 512 * 512 * num_runs / (1.0e9 * elapsed_serial);
  printf("======================================================================================================\n");
  printf("\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n",512);
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("Performance:\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------------------------------------------\n");
  printf("matmul_omp:\t\t%4f\t%4f\n",elapsed,gflops_omp);
  printf("matmul_serial:\t\t%4f\t%4f\n",elapsed_serial,gflops_serial);
  printf("Correctness check: %f\n",(check(C_simd,C_serial)));
  return 0;
}
