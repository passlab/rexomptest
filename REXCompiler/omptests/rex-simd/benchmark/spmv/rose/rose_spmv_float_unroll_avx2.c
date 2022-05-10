#include "rex_kmp.h" 
////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
#include <immintrin.h> 
#define REAL float

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//#define DEFAULT_DIMSIZE 256

void print_array(char *title,char *name,float *A,int n,int m)
{
  fprintf(stderr,"%s:\n",title);
  int i;
  int j;
  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) {
      fprintf(stderr,"%s[%d][%d]:%f  ",name,i,j,A[i * m + j]);
    }
    fprintf(stderr,"\n");
  }
  fprintf(stderr,"\n");
}
/*  subroutine error_check (n,m,alpha,dx,dy,u,f)
 implicit none
 ************************************************************
 * Checks error between numerical and exact solution
 *
 ************************************************************/

int main(int argc,char *argv[])
{
  int status = 0;
  int *ia;
  int *ja;
  float *a;
  float *x;
  float *y;
  int row;
  int i;
  int j;
  int idx;
  int n;
  int nnzMax;
  int nnz;
  int nrows;
  float ts;
  float t;
  float rate;
  n = 10240;
//n = 24;
  if (argc > 1) 
    n = atoi(argv[1]);
  nrows = n * n;
  nnzMax = nrows * 5;
  ia = ((int *)(malloc(nrows * sizeof(int ))));
  ja = ((int *)(malloc(nnzMax * sizeof(int ))));
  a = ((float *)(malloc(nnzMax * sizeof(float ))));
/* Allocate the source and result vectors */
  x = ((float *)(malloc(nrows * sizeof(float ))));
  y = ((float *)(malloc(nrows * sizeof(float ))));
  row = 0;
  nnz = 0;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      ia[row] = nnz;
      if (i > 0) {
        ja[nnz] = row - n;
        a[nnz] = (- 1.0);
        nnz++;
      }
      if (j > 0) {
        ja[nnz] = row - 1;
        a[nnz] = (- 1.0);
        nnz++;
      }
      ja[nnz] = row;
      a[nnz] = 4.0;
      nnz++;
      if (j < n - 1) {
        ja[nnz] = row + 1;
        a[nnz] = (- 1.0);
        nnz++;
      }
      if (i < n - 1) {
        ja[nnz] = row + n;
        a[nnz] = (- 1.0);
        nnz++;
      }
      row++;
    }
  }
  ia[row] = nnz;
/* Create the source (x) vector */
  for (i = 0; i < nrows; i++) 
    x[i] = 1.0;
  double elapsed = read_timer();
  for (row = 0; row < nrows; row++) {
    float sum = 0.0;
    __mmask8 __mask0;
    __mmask8 __mask1;
    __mmask8 __mask2 = _kxnor_mask8(__mask0,__mask1);
    __m256 __buf0 = _mm256_setzero_ps();
    __m256 __part0 = _mm256_setzero_ps();
    __mmask8 __mask3;
    __mmask8 __mask4;
    __mmask8 __mask5 = _kxnor_mask8(__mask3,__mask4);
    __m256 __buf4 = _mm256_setzero_ps();
    __m256 __part5 = _mm256_setzero_ps();
    __mmask8 __mask6;
    __mmask8 __mask7;
    __mmask8 __mask8 = _kxnor_mask8(__mask6,__mask7);
    __m256 __buf8 = _mm256_setzero_ps();
    __m256 __part10 = _mm256_setzero_ps();
    __mmask8 __mask9;
    __mmask8 __mask10;
    __mmask8 __mask11 = _kxnor_mask8(__mask9,__mask10);
    __m256 __buf12 = _mm256_setzero_ps();
    __m256 __part15 = _mm256_setzero_ps();
    __mmask8 __mask12;
    __mmask8 __mask13;
    __mmask8 __mask14 = _kxnor_mask8(__mask12,__mask13);
    __m256 __buf16 = _mm256_setzero_ps();
    __m256 __part20 = _mm256_setzero_ps();
    __mmask8 __mask15;
    __mmask8 __mask16;
    __mmask8 __mask17 = _kxnor_mask8(__mask15,__mask16);
    __m256 __buf20 = _mm256_setzero_ps();
    __m256 __part25 = _mm256_setzero_ps();
    __mmask8 __mask18;
    __mmask8 __mask19;
    __mmask8 __mask20 = _kxnor_mask8(__mask18,__mask19);
    __m256 __buf24 = _mm256_setzero_ps();
    __m256 __part30 = _mm256_setzero_ps();
    __mmask8 __mask21;
    __mmask8 __mask22;
    __mmask8 __mask23 = _kxnor_mask8(__mask21,__mask22);
    __m256 __buf28 = _mm256_setzero_ps();
    __m256 __part35 = _mm256_setzero_ps();
    for (idx = ia[row]; idx <= ia[row + 1] - 1; idx += 8 * 8) {
      __m256 __vec1 = _mm256_loadu_ps(&a[idx]);
      __m256i __vindex0 = _mm256_loadu_si256((__m256i *)(&ja[idx]));
      __m256 __vec2 = _mm256_mask_i32gather_ps(__buf0,__mask2,__vindex0,x,4);
      __m256 __vec3 = _mm256_mul_ps(__vec2,__vec1);
      __m256 __vec4 = _mm256_add_ps(__vec3,__part0);
      __part0 = (__vec4);
      __m256 __vec6 = _mm256_loadu_ps(&a[idx + 8 * 1]);
      __m256i __vindex1 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 1]));
      __m256 __vec7 = _mm256_mask_i32gather_ps(__buf4,__mask5,__vindex1,x,4);
      __m256 __vec8 = _mm256_mul_ps(__vec7,__vec6);
      __m256 __vec9 = _mm256_add_ps(__vec8,__part5);
      __part5 = (__vec9);
      __m256 __vec11 = _mm256_loadu_ps(&a[idx + 8 * 2]);
      __m256i __vindex2 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 2]));
      __m256 __vec12 = _mm256_mask_i32gather_ps(__buf8,__mask8,__vindex2,x,4);
      __m256 __vec13 = _mm256_mul_ps(__vec12,__vec11);
      __m256 __vec14 = _mm256_add_ps(__vec13,__part10);
      __part10 = (__vec14);
      __m256 __vec16 = _mm256_loadu_ps(&a[idx + 8 * 3]);
      __m256i __vindex3 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 3]));
      __m256 __vec17 = _mm256_mask_i32gather_ps(__buf12,__mask11,__vindex3,x,4);
      __m256 __vec18 = _mm256_mul_ps(__vec17,__vec16);
      __m256 __vec19 = _mm256_add_ps(__vec18,__part15);
      __part15 = (__vec19);
      __m256 __vec21 = _mm256_loadu_ps(&a[idx + 8 * 4]);
      __m256i __vindex4 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 4]));
      __m256 __vec22 = _mm256_mask_i32gather_ps(__buf16,__mask14,__vindex4,x,4);
      __m256 __vec23 = _mm256_mul_ps(__vec22,__vec21);
      __m256 __vec24 = _mm256_add_ps(__vec23,__part20);
      __part20 = (__vec24);
      __m256 __vec26 = _mm256_loadu_ps(&a[idx + 8 * 5]);
      __m256i __vindex5 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 5]));
      __m256 __vec27 = _mm256_mask_i32gather_ps(__buf20,__mask17,__vindex5,x,4);
      __m256 __vec28 = _mm256_mul_ps(__vec27,__vec26);
      __m256 __vec29 = _mm256_add_ps(__vec28,__part25);
      __part25 = (__vec29);
      __m256 __vec31 = _mm256_loadu_ps(&a[idx + 8 * 6]);
      __m256i __vindex6 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 6]));
      __m256 __vec32 = _mm256_mask_i32gather_ps(__buf24,__mask20,__vindex6,x,4);
      __m256 __vec33 = _mm256_mul_ps(__vec32,__vec31);
      __m256 __vec34 = _mm256_add_ps(__vec33,__part30);
      __part30 = (__vec34);
      __m256 __vec36 = _mm256_loadu_ps(&a[idx + 8 * 7]);
      __m256i __vindex7 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 7]));
      __m256 __vec37 = _mm256_mask_i32gather_ps(__buf28,__mask23,__vindex7,x,4);
      __m256 __vec38 = _mm256_mul_ps(__vec37,__vec36);
      __m256 __vec39 = _mm256_add_ps(__vec38,__part35);
      __part35 = (__vec39);
    }
    __m256 __buf30 = __part35;
    __buf30 = _mm256_hadd_ps(__buf30,__buf30);
    __buf30 = _mm256_hadd_ps(__buf30,__buf30);
    float __buf31[8];
    _mm256_storeu_ps(&__buf31,__buf30);
    sum += __buf31[0] + __buf31[6];
    __m256 __buf26 = __part30;
    __buf26 = _mm256_hadd_ps(__buf26,__buf26);
    __buf26 = _mm256_hadd_ps(__buf26,__buf26);
    float __buf27[8];
    _mm256_storeu_ps(&__buf27,__buf26);
    sum += __buf27[0] + __buf27[6];
    __m256 __buf22 = __part25;
    __buf22 = _mm256_hadd_ps(__buf22,__buf22);
    __buf22 = _mm256_hadd_ps(__buf22,__buf22);
    float __buf23[8];
    _mm256_storeu_ps(&__buf23,__buf22);
    sum += __buf23[0] + __buf23[6];
    __m256 __buf18 = __part20;
    __buf18 = _mm256_hadd_ps(__buf18,__buf18);
    __buf18 = _mm256_hadd_ps(__buf18,__buf18);
    float __buf19[8];
    _mm256_storeu_ps(&__buf19,__buf18);
    sum += __buf19[0] + __buf19[6];
    __m256 __buf14 = __part15;
    __buf14 = _mm256_hadd_ps(__buf14,__buf14);
    __buf14 = _mm256_hadd_ps(__buf14,__buf14);
    float __buf15[8];
    _mm256_storeu_ps(&__buf15,__buf14);
    sum += __buf15[0] + __buf15[6];
    __m256 __buf10 = __part10;
    __buf10 = _mm256_hadd_ps(__buf10,__buf10);
    __buf10 = _mm256_hadd_ps(__buf10,__buf10);
    float __buf11[8];
    _mm256_storeu_ps(&__buf11,__buf10);
    sum += __buf11[0] + __buf11[6];
    __m256 __buf6 = __part5;
    __buf6 = _mm256_hadd_ps(__buf6,__buf6);
    __buf6 = _mm256_hadd_ps(__buf6,__buf6);
    float __buf7[8];
    _mm256_storeu_ps(&__buf7,__buf6);
    sum += __buf7[0] + __buf7[6];
    __m256 __buf2 = __part0;
    __buf2 = _mm256_hadd_ps(__buf2,__buf2);
    __buf2 = _mm256_hadd_ps(__buf2,__buf2);
    float __buf3[8];
    _mm256_storeu_ps(&__buf3,__buf2);
    sum += __buf3[0] + __buf3[6];
    y[row] = sum;
  }
  elapsed = read_timer() - elapsed;
//printf("seq elasped time(s): %.4f\n", elapsed);
  int errors = 0;
  for (row = 0; row < nrows; row++) {
    if (y[row] < 0) {
//fprintf(stderr,"y[%d]=%f, fails consistency test\n", row, y[row]);
      ++errors;
    }
  }
//printf("Errors: %d\n", errors);
  printf("%.4f\n",elapsed);
  free(ia);
  free(ja);
  free(a);
  free(x);
  free(y);
  return 0;
}
