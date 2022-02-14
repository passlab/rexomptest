/*
 * matrix vector
 * A[N][N] * B[N] = C[N]
 *
 */
#include <stdio.h>
#include <stdlib.h>
//#include <math.h>
#include <sys/time.h>
#include <string.h>
#define TEAM_NUM 1024
#define TEAM_SIZE 1024
/* read timer in ms */
#include "rex_kmp.h" 

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,((void *)0));
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}
#define REAL float
void init(int ,float *);
/*
REAL check(REAL*A, REAL*B, int n)
{
    int i;
    REAL diffsum =0.0, sum = 0.0;
    for (i = 0; i < n; i++) {
        diffsum += fabs(A[i] - B[i]);
        sum += fabs(B[i]);
    }
    return diffsum;
}
*/
void matvec_omp_cpu(int ,float *,float *,float *);
void matvec_omp_gpu(int ,float *,float *,float *);
int main(int ,char *[]);

void OUT__3__4980__matvec_omp_cpu__50__(int *__global_tid,int *__bound_tid,int *Np__,float **Ap__,float **Bp__,float **Cp__)
{
  int *N = (int *)Np__;
  float **A = (float **)Ap__;
  float **B = (float **)Bp__;
  float **C = (float **)Cp__;
  int _p_i;
  int _p_j;
  int __index_;
  int __lower_ = 0;
  int __upper_ =  *N - 1;
  int __stride_ = 1;
  int __last_iter_ = 0;
  int __global_tid_matvec_omp_cpu_50_0 = __kmpc_global_thread_num(0);
  __kmpc_for_static_init_4(0,__global_tid_matvec_omp_cpu_50_0,34,&__last_iter_,&__lower_,&__upper_,&__stride_,1,1);
  if (__upper_ >  *N - 1) 
    __upper_ =  *N - 1;
  for (__index_ = __lower_; __index_ <= __upper_; __index_ += 1) {
    float temp = (float )0.0;
    for (_p_j = 0; _p_j <  *N; _p_j++) 
      temp += ( *A)[__index_ *  *N + _p_j] * ( *B)[_p_j];
    ( *C)[__index_] = temp;
  }
  __kmpc_for_static_fini(0,__global_tid_matvec_omp_cpu_50_0);
  __kmpc_barrier(0,__global_tid_matvec_omp_cpu_50_0);
}
