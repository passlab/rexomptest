#include "rex_kmp.h" 
#include <stdio.h>
#include <omp.h>
extern int omp_num_threads;
#define BS 16
#define AA(_i,_j) a[offset*size+_i*size+_j+offset]
#define BB(_i,_j) a[_i*size+_j]
#ifdef OMP_OFFLOAD
#endif

void lud_diagonal_omp(float *a,int size,int offset)
{
  int i;
  int j;
  int k;
  for (i = 0; i < 16; i++) {
    for (j = i; j < 16; j++) {
      for (k = 0; k < i; k++) {
        a[offset * size + i * size + j + offset] = a[offset * size + i * size + j + offset] - a[offset * size + i * size + k + offset] * a[offset * size + k * size + j + offset];
      }
    }
    float temp = 1.f / a[offset * size + i * size + i + offset];
    for (j = i + 1; j < 16; j++) {
      for (k = 0; k < i; k++) {
        a[offset * size + j * size + i + offset] = a[offset * size + j * size + i + offset] - a[offset * size + j * size + k + offset] * a[offset * size + k * size + i + offset];
      }
      a[offset * size + j * size + i + offset] = a[offset * size + j * size + i + offset] * temp;
    }
  }
}
// implements block LU factorization 
extern void OUT__1__8381__lud_omp__57__(int *__global_tid,int *__bound_tid);
extern void OUT__2__8381__lud_omp__111__(int *__global_tid,int *__bound_tid);

void lud_omp(float *a,int size)
{
  int offset;
  int chunk_idx;
  int size_inter;
  int chunks_in_inter_row;
  int chunks_per_inter;
  omp_set_num_threads(224);
  printf("running OMP on host\n");
  omp_set_num_threads(omp_num_threads);
  for (offset = 0; offset < size - 16; offset += 16) {
// lu factorization of left-top corner block diagonal matrix 
//
    lud_diagonal_omp(a,size,offset);
    size_inter = size - offset - 16;
    chunks_in_inter_row = size_inter / 16;
// calculate perimeter block matrices
// 
    __kmpc_fork_call(0,0,OUT__1__8381__lud_omp__57__,0);
// update interior block matrices
//
    chunks_per_inter = chunks_in_inter_row * chunks_in_inter_row;
    __kmpc_fork_call(0,0,OUT__2__8381__lud_omp__111__,0);
  }
  lud_diagonal_omp(a,size,offset);
#ifdef OMP_OFFLOAD
#endif
}
