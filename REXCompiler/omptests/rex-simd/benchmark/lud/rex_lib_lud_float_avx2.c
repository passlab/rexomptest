#include <stdio.h>
#include <omp.h>
#include "rex_kmp.h" 
#include <immintrin.h> 
#include <immintrin.h> 
#include <immintrin.h> 
#include <immintrin.h> 
extern int omp_num_threads;
#define BS 16
#define AA(_i,_j) a[offset*size+_i*size+_j+offset]
#define BB(_i,_j) a[_i*size+_j]
#ifdef OMP_OFFLOAD
#endif
void lud_diagonal_omp(float *,int ,int );
// implements block LU factorization 
void lud_omp(float *,int );

void OUT__1__8861__lud_omp__57__(int *__global_tid,int *__bound_tid)
{
{
    int _p_chunk_idx;
    int __index_;
    int __lower_ = 0;
    int __upper_ = chunks_in_inter_row - 1;
    int __stride_ = 1;
    int __last_iter_ = 0;
    int __global_tid_OUT__1__8861__lud_omp__57___0_0 = __kmpc_global_thread_num(0);
    __kmpc_for_static_init_4(0,__global_tid_OUT__1__8861__lud_omp__57___0_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
    if (__upper_ > chunks_in_inter_row - 1) 
      __upper_ = chunks_in_inter_row - 1;
    for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
      int i;
      int j;
      int k;
      int i_global;
      int j_global;
      int i_here;
      int j_here;
      float sum;
      float temp[256] __attribute__((aligned(64))) ;
      for (i = 0; i < 16; i++) {
      }
      i_global = offset;
      j_global = offset;
// processing top perimeter
//
      j_global += 16 * (__index_ + 1);
      for (j = 0; j < 16; j++) {
        for (i = 0; i < 16; i++) {
          sum = 0.f;
          for (k = 0; k < i; k++) {
            sum += temp[16 * i + k] * a[(i_global + k) * size + (j_global + j)];
          }
          i_here = i_global + i;
          j_here = j_global + j;
          a[i_here * size + j_here] = a[i_here * size + j_here] - sum;
        }
      }
// processing left perimeter
//
      j_global = offset;
      i_global += 16 * (__index_ + 1);
      for (i = 0; i < 16; i++) {
        for (j = 0; j < 16; j++) {
          sum = 0.f;
          for (k = 0; k < j; k++) {
            sum += a[(i_global + i) * size + (j_global + k)] * temp[16 * k + j];
          }
          i_here = i_global + i;
          j_here = j_global + j;
          a[size * i_here + j_here] = (a[size * i_here + j_here] - sum) / a[size * (offset + j) + offset + j];
        }
      }
    }
    __kmpc_for_static_fini(0,__global_tid_OUT__1__8861__lud_omp__57___0_0);
    __kmpc_barrier(0,__global_tid_OUT__1__8861__lud_omp__57___0_0);
  }
}

void OUT__2__8861__lud_omp__111__(int *__global_tid,int *__bound_tid)
{
{
    int _p_chunk_idx;
    int __index_;
    int __lower_ = 0;
    int __upper_ = chunks_per_inter - 1;
    int __stride_ = 1;
    int __last_iter_ = 0;
    int __global_tid_OUT__2__8861__lud_omp__111___0_1 = __kmpc_global_thread_num(0);
    __kmpc_for_static_init_4(0,__global_tid_OUT__2__8861__lud_omp__111___0_1,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
    if (__upper_ > chunks_per_inter - 1) 
      __upper_ = chunks_per_inter - 1;
    for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
      int i;
      int j;
      int k;
      int i_global;
      int j_global;
      float temp_top[256] __attribute__((aligned(64))) ;
      float temp_left[256] __attribute__((aligned(64))) ;
      float sum[16] __attribute__((aligned(64)))  = {(0.f)};
      i_global = offset + 16 * (1 + __index_ / chunks_in_inter_row);
      j_global = offset + 16 * (1 + __index_ % chunks_in_inter_row);
      for (i = 0; i < 16; i++) {
      }
      for (i = 0; i < 16; i++) {
        __m256 __vec11 = _mm256_set1_ps(0.00000L);
        for (k = 0; k < 16; k++) {
        }
      }
    }
    __kmpc_for_static_fini(0,__global_tid_OUT__2__8861__lud_omp__111___0_1);
    __kmpc_barrier(0,__global_tid_OUT__2__8861__lud_omp__111___0_1);
  }
}
