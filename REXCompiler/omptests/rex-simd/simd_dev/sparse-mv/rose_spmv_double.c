#include "rex_kmp.h" 
////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
#include <immintrin.h> 

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//#define DEFAULT_DIMSIZE 256

void print_array(char *title,char *name,double *A,int n,int m)
{
  printf("%s:\n",title);
  int i;
  int j;
  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) {
      printf("%s[%d][%d]:%f  ",name,i,j,A[i * m + j]);
    }
    printf("\n");
  }
  printf("\n");
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
  double *a;
  double *x;
  double *y;
  int row;
  int i;
  int j;
  int idx;
  int n;
  int nnzMax;
  int nnz;
  int nrows;
  double ts;
  double t;
  double rate;
  n = 10240;
//n = 24;
  if (argc > 1) 
    n = atoi(argv[1]);
  nrows = n * n;
  nnzMax = nrows * 5;
  ia = ((int *)(malloc(nrows * sizeof(int ))));
  ja = ((int *)(malloc(nnzMax * sizeof(int ))));
  a = ((double *)(malloc(nnzMax * sizeof(double ))));
/* Allocate the source and result vectors */
  x = ((double *)(malloc(nrows * sizeof(double ))));
  y = ((double *)(malloc(nrows * sizeof(double ))));
  row = 0;
  nnz = 0;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      ia[row] = nnz;
      if (i > 0) {
        ja[nnz] = row - n;
        a[nnz] = - 1.0;
        nnz++;
      }
      if (j > 0) {
        ja[nnz] = row - 1;
        a[nnz] = - 1.0;
        nnz++;
      }
      ja[nnz] = row;
      a[nnz] = 4.0;
      nnz++;
      if (j < n - 1) {
        ja[nnz] = row + 1;
        a[nnz] = - 1.0;
        nnz++;
      }
      if (i < n - 1) {
        ja[nnz] = row + n;
        a[nnz] = - 1.0;
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
  int flops = 0;
  for (row = 0; row < nrows; row++) {
    double sum = 0.0;
    __m256d __vec0 = _mm256_set1_pd(sum);
    __m256d __part5 = _mm256_setzero_pd();
    __m256i __vec6 = _mm256_set1_epi32(flops);
    __m256i __vec7 = _mm256_set1_epi32(2);
    __m256i __part9 = _mm256_setzero_si256();
    for (idx = ia[row]; idx <= ia[row + 1] - 1; idx += 4) {
      __m256d __vec1 = _mm256_loadu_pd(&a[idx]);
      __m256i __mask0 = _mm256_loadu_si256((__m256i *)(&ja[idx]));
      __m128i __mask02 = _mm256_extractf128_si256(__mask0,0);
      __m256d __vec2 = _mm256_i32gather_pd(x,__mask02,8);
      __m256d __vec3 = _mm256_mul_pd(__vec2,__vec1);
      __m256d __vec4 = _mm256_add_pd(__vec3,__vec0);
      __part5 = _mm256_add_pd(__part5,__vec4);
      __m256i __vec8 = _mm256_add_epi32(__vec7,__vec6);
      __part9 = _mm256_add_epi32(__part9,__vec8);
    }
    __m256i __buf4 = __part9;
    __buf4 = _mm256_hadd_epi32(__buf4,__buf4);
    __buf4 = _mm256_hadd_epi32(__buf4,__buf4);
    int __buf5[8];
    _mm256_storeu_si256((__m256i *)(&__buf5),__buf4);
    flops = __buf5[0] + __buf5[6];
    __m256d __buf1 = __part5;
    __buf1 = _mm256_hadd_pd(__buf1,__buf1);
    double __buf2[4];
    _mm256_storeu_pd(&__buf2,__buf1);
    sum = __buf2[0] + __buf2[2];
    y[row] = sum;
  }
  elapsed = read_timer() - elapsed;
  double gflops = flops / (1.0e9 * elapsed);
  printf("seq elasped time(s): %.4f\n",elapsed);
  printf("GFlops: %.4f\n",gflops);
  for (row = 0; row < nrows; row++) {
    if (y[row] < 0) {
      fprintf(stderr,"y[%d]=%f, fails consistency test\n",row,y[row]);
    }
  }
  free(ia);
  free(ja);
  free(a);
  free(x);
  free(y);
  return 0;
}
