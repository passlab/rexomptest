#include "rex_kmp.h" 
// create a list of 64 numbers, and only sum the even ones
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h> 
#define N 32000
#define SCALE 8

int main(argc,argv)
int argc;
char **argv;
{
  int i;
  int status = 0;
  srand((time((void *)0)));
  double *numbers = (malloc(sizeof(double ) * 32000));
  double *result1 = (malloc(sizeof(double ) * 32000));
  double *result2 = (malloc(sizeof(double ) * 32000));
  int *mask = (malloc(sizeof(int ) * 32000));
// Init the numbers
  for (int i = 0; i < 32000; i++) 
    numbers[i] = (rand() % 10);
  for (int i = 0; i < 32000; i++) {
    result1[i] = 0;
    result2[i] = 0;
  }
  for (int i = 0; i < 32000; i++) 
    mask[i] = rand() % 32000;
  for (int i = 0; i < 8; i++) 
    printf("%.1f ",numbers[i]);
  puts("\n---");
  for (int i = 0; i < 8; i++) 
    printf("%d ",mask[i]);
  puts("\n---");
  puts("---------------------------------------------");
//Serial
  for (int i = 0; i < 8; i++) {
    result1[mask[i]] = numbers[mask[i]];
  }
  for (i = 0; i <= 7; i += 4) {
    __m256i __mask0 = _mm256_loadu_si256((__m256i *)(&mask[i]));
    __m128i __mask02 = _mm256_extractf128_si256(__mask0,0);
    __m256d __vec0 = _mm256_i32gather_pd(numbers,__mask02,8);
    __m256i __mask1 = _mm256_loadu_si256((__m256i *)(&mask[i]));
    __m128i __mask12 = _mm256_extractf128_si256(__mask1,0);
    _mm256_i32scatter_pd(result2,__mask12,__vec0,8);
  }
// print
  for (int i = 0; i < 8; i++) 
    printf("%.1f ",result1[i]);
  puts("\n---");
  for (int i = 0; i < 8; i++) 
    printf("%.1f ",result2[i]);
  puts("\n---");
  int errors = 0;
  for (int i = 0; i < 8; i++) {
    if (result1[i] != result2[i]) 
      ++errors;
  }
  printf("Errors: %d\n",errors);
//printf("Result1: %f | Result2: %f\n", result1, result2);
  return 0;
}
