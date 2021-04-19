#include "rex_kmp.h" 
// create a list of 64 numbers, and only sum the even ones
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h> 
#define N 32000
#define SCALE 16

int main(argc,argv)
int argc;
char **argv;
{
  int i;
  int status = 0;
  srand((time((void *)0)));
  int *numbers = (malloc(sizeof(int ) * 32000));
  int *result1 = (malloc(sizeof(int ) * 32000));
  int *result2 = (malloc(sizeof(int ) * 32000));
  int *mask = (malloc(sizeof(int ) * 32000));
// Init the numbers
  for (int i = 0; i < 32000; i++) 
    numbers[i] = rand() % 10;
  for (int i = 0; i < 32000; i++) {
    result1[i] = 0;
    result2[i] = 0;
  }
  for (int i = 0; i < 32000; i++) 
    mask[i] = rand() % 32000;
  for (int i = 0; i < 16; i++) 
    printf("%d ",numbers[i]);
  puts("\n---");
  for (int i = 0; i < 16; i++) 
    printf("%d ",mask[i]);
  puts("\n---");
  puts("---------------------------------------------");
//Serial
  for (int i = 0; i < 16; i++) {
    result1[mask[i]] = numbers[mask[i]];
  }
  for (i = 0; i <= 15; i += 16) {
    __m512i __mask0 = _mm512_loadu_si512((__m512i *)(&mask[i]));
    __m512i __vec0 = _mm512_i32gather_epi32(__mask0,numbers,4);
    __m512i __mask1 = _mm512_loadu_si512((__m512i *)(&mask[i]));
    _mm512_i32scatter_epi32(result2,__mask1,__vec0,4);
  }
// print
  for (int i = 0; i < 16; i++) 
    printf("%d ",result1[i]);
  puts("\n---");
  for (int i = 0; i < 16; i++) 
    printf("%d ",result2[i]);
  puts("\n---");
  int errors = 0;
  for (int i = 0; i < 16; i++) {
    if (result1[i] != result2[i]) 
      ++errors;
  }
  printf("Errors: %d\n",errors);
//printf("Result1: %f | Result2: %f\n", result1, result2);
  return 0;
}
