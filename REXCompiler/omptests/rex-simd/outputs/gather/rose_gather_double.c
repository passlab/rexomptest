#include "rex_kmp.h" 
// create a list of 64 numbers, and only sum the even ones
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h> 
#define N 32000

int main(argc,argv)
int argc;
char **argv;
{
  int i;
  int status = 0;
  srand((time((void *)0)));
  double *numbers = (malloc(sizeof(double ) * 32000));
  int *mask = (malloc(sizeof(int ) * 32000));
// Init the numbers
  for (int i = 0; i < 32000; i++) 
    numbers[i] = (rand() % 10);
  for (int i = 0; i < 32000; i++) 
    mask[i] = rand() % 32000;
/*for (int i = 0; i<8; i++) printf("%.1f ", numbers[i]);
    puts("\n---");
    for (int i = 0; i<8; i++) printf("%d ", mask[i]);
    puts("\n---");*/
//Serial
  double result1 = 0;
  for (int i = 0; i < 32000; i++) {
    result1 += numbers[mask[i]];
  }
  double result2 = 0;
  __m512d __vec0 = _mm512_set1_pd(result2);
  __m512d __part3 = _mm512_setzero_pd();
  for (i = 0; i <= 31999; i += 8) {
    __m512i __mask0 = _mm512_loadu_si512((__m512i *)(&mask[i]));
    __m256i __mask02 = _mm512_extracti32x8_epi32(__mask0,0);
    __m512d __vec1 = _mm512_i32gather_pd(__mask02,numbers,8);
    __m512d __vec2 = _mm512_add_pd(__vec1,__vec0);
    __part3 = _mm512_add_pd(__part3,__vec2);
  }
  __m256d __buf0 = _mm512_extractf64x4_pd(__part3,0);
  __m256d __buf1 = _mm512_extractf64x4_pd(__part3,1);
  __buf1 = _mm256_add_pd(__buf0,__buf1);
  __buf1 = _mm256_hadd_pd(__buf1,__buf1);
  double __buf2[4];
  _mm256_storeu_pd(&__buf2,__buf1);
  result2 = __buf2[0] + __buf2[2];
// print
  printf("Result1: %f | Result2: %f\n",result1,result2);
  return 0;
}
