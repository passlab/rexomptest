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
    __m256 __part0 = _mm256_setzero_ps();
    float sum = 0.0;
    __mmask8 __mask0;
    __mmask8 __mask1;
    __mmask8 __mask2 = _kxnor_mask8(__mask0,__mask1);
    __m256 __buf0 = _mm256_setzero_ps();
    __mmask8 __mask3;
    __mmask8 __mask4;
    __mmask8 __mask5 = _kxnor_mask8(__mask3,__mask4);
    __m256 __buf1 = _mm256_setzero_ps();
    __mmask8 __mask6;
    __mmask8 __mask7;
    __mmask8 __mask8 = _kxnor_mask8(__mask6,__mask7);
    __m256 __buf2 = _mm256_setzero_ps();
    __mmask8 __mask9;
    __mmask8 __mask10;
    __mmask8 __mask11 = _kxnor_mask8(__mask9,__mask10);
    __m256 __buf3 = _mm256_setzero_ps();
    __mmask8 __mask12;
    __mmask8 __mask13;
    __mmask8 __mask14 = _kxnor_mask8(__mask12,__mask13);
    __m256 __buf4 = _mm256_setzero_ps();
    __mmask8 __mask15;
    __mmask8 __mask16;
    __mmask8 __mask17 = _kxnor_mask8(__mask15,__mask16);
    __m256 __buf5 = _mm256_setzero_ps();
    __mmask8 __mask18;
    __mmask8 __mask19;
    __mmask8 __mask20 = _kxnor_mask8(__mask18,__mask19);
    __m256 __buf6 = _mm256_setzero_ps();
    __mmask8 __mask21;
    __mmask8 __mask22;
    __mmask8 __mask23 = _kxnor_mask8(__mask21,__mask22);
    __m256 __buf7 = _mm256_setzero_ps();
    for (idx = ia[row]; idx <= ia[row + 1] - 1; idx += 8 * 8) {
      __m256 __vec1 = _mm256_loadu_ps(&a[idx]);
      __m256i __vindex0 = _mm256_loadu_si256((__m256i *)(&ja[idx]));
      __m256 __vec2 = _mm256_mask_i32gather_ps(__buf0,__mask2,__vindex0,x,4);
      __m256 __vec3 = _mm256_mul_ps(__vec2,__vec1);
      __m256 __vec4 = _mm256_add_ps(__vec3,__part0);
      __part0 = (__vec4);
      __m256 __vec5 = _mm256_loadu_ps(&a[idx + 8 * 1]);
      __m256i __vindex1 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 1]));
      __m256 __vec6 = _mm256_mask_i32gather_ps(__buf1,__mask5,__vindex1,x,4);
      __m256 __vec7 = _mm256_mul_ps(__vec6,__vec5);
      __m256 __vec8 = _mm256_add_ps(__vec7,__part0);
      __part0 = (__vec8);
      __m256 __vec9 = _mm256_loadu_ps(&a[idx + 8 * 2]);
      __m256i __vindex2 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 2]));
      __m256 __vec10 = _mm256_mask_i32gather_ps(__buf2,__mask8,__vindex2,x,4);
      __m256 __vec11 = _mm256_mul_ps(__vec10,__vec9);
      __m256 __vec12 = _mm256_add_ps(__vec11,__part0);
      __part0 = (__vec12);
      __m256 __vec13 = _mm256_loadu_ps(&a[idx + 8 * 3]);
      __m256i __vindex3 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 3]));
      __m256 __vec14 = _mm256_mask_i32gather_ps(__buf3,__mask11,__vindex3,x,4);
      __m256 __vec15 = _mm256_mul_ps(__vec14,__vec13);
      __m256 __vec16 = _mm256_add_ps(__vec15,__part0);
      __part0 = (__vec16);
      __m256 __vec17 = _mm256_loadu_ps(&a[idx + 8 * 4]);
      __m256i __vindex4 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 4]));
      __m256 __vec18 = _mm256_mask_i32gather_ps(__buf4,__mask14,__vindex4,x,4);
      __m256 __vec19 = _mm256_mul_ps(__vec18,__vec17);
      __m256 __vec20 = _mm256_add_ps(__vec19,__part0);
      __part0 = (__vec20);
      __m256 __vec21 = _mm256_loadu_ps(&a[idx + 8 * 5]);
      __m256i __vindex5 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 5]));
      __m256 __vec22 = _mm256_mask_i32gather_ps(__buf5,__mask17,__vindex5,x,4);
      __m256 __vec23 = _mm256_mul_ps(__vec22,__vec21);
      __m256 __vec24 = _mm256_add_ps(__vec23,__part0);
      __part0 = (__vec24);
      __m256 __vec25 = _mm256_loadu_ps(&a[idx + 8 * 6]);
      __m256i __vindex6 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 6]));
      __m256 __vec26 = _mm256_mask_i32gather_ps(__buf6,__mask20,__vindex6,x,4);
      __m256 __vec27 = _mm256_mul_ps(__vec26,__vec25);
      __m256 __vec28 = _mm256_add_ps(__vec27,__part0);
      __part0 = (__vec28);
      __m256 __vec29 = _mm256_loadu_ps(&a[idx + 8 * 7]);
      __m256i __vindex7 = _mm256_loadu_si256((__m256i *)(&ja[idx + 1 * 7]));
      __m256 __vec30 = _mm256_mask_i32gather_ps(__buf7,__mask23,__vindex7,x,4);
      __m256 __vec31 = _mm256_mul_ps(__vec30,__vec29);
      __m256 __vec32 = _mm256_add_ps(__vec31,__part0);
      __part0 = (__vec32);
    }
    __m256 __buf9 = __part0;
    __buf9 = _mm256_hadd_ps(__buf9,__buf9);
    __buf9 = _mm256_hadd_ps(__buf9,__buf9);
    float __buf10[8];
    _mm256_storeu_ps(&__buf10,__buf9);
    sum += __buf10[0] + __buf10[6];
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
