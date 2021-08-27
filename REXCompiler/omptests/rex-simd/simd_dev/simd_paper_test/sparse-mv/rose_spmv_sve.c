#include "rex_kmp.h" 
////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
#include <arm_sve.h> 
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
  int flops = 0;
  for (row = 0; row < nrows; row++) {
    float sum = 0.0;
    svbool_t __pg0 = svwhilelt_b32(0,ia[row + 1] - 1);
    svfloat32_t __vec0 = svdup_f32(sum);
    svfloat32_t __part5 = svdup_f32(0.00000L);
    svint32_t __vec6 = svdup_s32(flops);
    svint32_t __vec7 = svdup_s32(2);
    svint32_t __part9 = svdup_s32(0);
    for (idx = ia[row]; idx <= ia[row + 1] - 1; idx += svcntw()) {
      svfloat32_t __vec1 = svld1(__pg0,&a[idx]);
      svfloat32_t __vec2 = x[ja[idx]];
      svfloat32_t __vec3 = svmul_f32_m(__pg0,__vec2,__vec1);
      svfloat32_t __vec4 = svadd_f32_m(__pg0,__vec3,__vec0);
      __part5 = svadd_f32_m(__pg0,__part5,__vec4);
      svint32_t __vec8 = svadd_s32_m(__pg0,__vec7,__vec6);
      __part9 = svadd_s32_m(__pg0,__part9,__vec8);
      __pg0 = svwhilelt_b32(idx,ia[row + 1] - 1);
    }
    int __buf1[(svcntw())];
    __pg0 = svwhilelt_b32((uint64_t )0,(svcntw()));
    svst1(__pg0,&__buf1,__part9);
    for (int __i = 0; __i < svcntw(); ++__i) 
      flops += __buf1[__i];
    float __buf0[(svcntw())];
    __pg0 = svwhilelt_b32((uint64_t )0,(svcntw()));
    svst1(__pg0,&__buf0,__part5);
    for (int __i = 0; __i < svcntw(); ++__i) 
      sum += __buf0[__i];
    y[row] = sum;
  }
  elapsed = read_timer() - elapsed;
  double gflops = flops / (1.0e9 * elapsed);
  printf("seq elasped time(s): %.4f\n",elapsed);
  printf("GFlops: %.4f\n",gflops);
  int errors = 0;
  for (row = 0; row < nrows; row++) {
    if (y[row] < 0) {
//fprintf(stderr,"y[%d]=%f, fails consistency test\n", row, y[row]);
      ++errors;
    }
  }
  printf("Errors: %d\n",errors);
  free(ia);
  free(ja);
  free(a);
  free(x);
  free(y);
  return 0;
}
