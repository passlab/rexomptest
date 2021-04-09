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
  __m256d __vec0 = _mm256_set1_pd(result2);
  __m256d __part3 = _mm256_setzero_pd();
  for (i = 0; i <= 31999; i += 4) {
    __m256i __mask0 = _mm256_loadu_si256((__m256i *)(&mask[i]));
    __m128i __mask02 = _mm256_extractf128_si256(__mask0,0);
    __m256d __vec1 = _mm256_i32gather_pd(numbers,__mask02,8);
    __m256d __vec2 = _mm256_add_pd(__vec1,__vec0);
    __part3 = _mm256_add_pd(__part3,__vec2);
  }
  __m256d __buf1 = __part3;
  __buf1 = _mm256_hadd_pd(__buf1,__buf1);
  double __buf2[4];
  _mm256_storeu_pd(&__buf2,__buf1);
  result2 = __buf2[0] + __buf2[2];
// print
  printf("Result1: %f | Result2: %f\n",result1,result2);
  return 0;
}
