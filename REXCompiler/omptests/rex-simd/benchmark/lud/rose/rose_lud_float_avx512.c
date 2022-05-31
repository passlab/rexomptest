#include "rex_kmp.h" 
#include <stdio.h>
#include <omp.h>
#include <immintrin.h> 
#include <immintrin.h> 
extern int omp_num_threads;

void lud_omp(float *a,int size)
{
  int i;
  int j;
  int k;
  float sum = 0;
  printf("num of threads = %d\n",omp_num_threads);
  for (i = 0; i < size; i++) {
    omp_set_num_threads(omp_num_threads);
    for (j = i; j < size; j++) {
      __m512 __part0 = _mm512_setzero_ps();
      __m512 __vec1 = _mm512_set1_ps(sum);
      sum = a[i * size + j];
      for (k = 0; k <= i - 1; k += 1 * 16) {
        __m512 __vec2 = _mm512_loadu_ps(&a[i * size + k]);
        __m512 __vec3 = _mm512_loadu_ps(&a[k * size + j]);
        __m512 __vec4 = _mm512_mul_ps(__vec3,__vec2);
        __m512 __vec5 = _mm512_sub_ps(__vec4,__vec1);
        __part0 = (__vec5);
      }
      __m256 __buf0 = _mm512_extractf32x8_ps(__part0,0);
      __m256 __buf1 = _mm512_extractf32x8_ps(__part0,1);
      __buf1 = _mm256_add_ps(__buf0,__buf1);
      __buf1 = _mm256_hadd_ps(__buf1,__buf1);
      __buf1 = _mm256_hadd_ps(__buf1,__buf1);
      float __buf2[8];
      _mm256_storeu_ps(&__buf2,__buf1);
      sum += __buf2[0] + __buf2[6];
      a[i * size + j] = sum;
    }
    for (j = i + 1; j < size; j++) {
      __m512 __vec6 = _mm512_set1_ps(sum);
      sum = a[j * size + i];
      for (k = 0; k <= i - 1; k += 1 * 16) {
        __m512 __vec7 = _mm512_loadu_ps(&a[j * size + k]);
        __m512 __vec8 = _mm512_loadu_ps(&a[k * size + i]);
        __m512 __vec9 = _mm512_mul_ps(__vec8,__vec7);
        __m512 __vec10 = _mm512_sub_ps(__vec9,__vec6);
        __part0 = (__vec10);
      }
      __m256 __buf3 = _mm512_(__part0,0);
      __m256 __buf4 = _mm512_(__part0,1);
      __buf4 = _mm256_add_(__buf3,__buf4);
      __buf4 = _mm256_hadd_(__buf4,__buf4);
      __buf4 = _mm256_hadd_(__buf4,__buf4);
      float __buf5[8];
      _mm256_storeu_(&__buf5,__buf4);
      sum += __buf5[0] + __buf5[6];
      a[j * size + i] = sum / a[i * size + i];
    }
  }
}
