#include "rex_kmp.h" 
char OUT__2__6066__stencil_omp_target__107__id__ = 0;
struct __tgt_offload_entry OUT__2__6066__stencil_omp_target__107__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__2__6066__stencil_omp_target__107__id__)), "OUT__2__6066__stencil_omp_target__107__kernel__", 0, 0, 0};
char OUT__1__6066__stencil_omp_target__109__id__ = 0;
struct __tgt_offload_entry OUT__1__6066__stencil_omp_target__109__omp_offload_entry__ __attribute__((section("omp_offloading_entries")))  = {((void *)(&OUT__1__6066__stencil_omp_target__109__id__)), "OUT__1__6066__stencil_omp_target__109__kernel__", 0, 0, 0};
#include <stdio.h>
#include <stdlib.h>
//#include <math.h>
#include <string.h>
#include <sys/time.h>
#define REAL double
#define FILTER_HEIGHT 5
#define FILTER_WIDTH 5
#define TEST 10
#define PROBLEM 256
#define TEAM_NUM 1024
#define TEAM_SIZE 1024
// clang -fopenmp -fopenmp-targets=nvptx64 -Xopenmp-target -march=sm_35 --cuda-path=/usr/local/cuda -O3 -lpthread -fpermissive -msse4.1 stencil_metadirective.c -o stencil.out
// Usage: ./stencil.out <size>
// e.g. ./stencil.out 512
void Convolution(const double *src,double *dst,int width,int height,const float *filter,int flt_width,int flt_height);
void ConvolutionMulti(const double *src,double *dst,int width,int height,const float *filter,int flt_width,int flt_height);
void stencil_omp(const double *src,double *dst,int width,int height,const float *filter,int flt_width,int flt_height);
void stencil_omp_target(double *src,double *dst,int width,int height,float *filter,int flt_width,int flt_height);

static double read_timer_ms()
{
  struct timeval timer;
  gettimeofday(&timer,(void *)0);
  return ((double )timer . tv_sec) * 1000.0 + ((double )timer . tv_usec) / 1000.0;
}

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

void initialize(int width,int height,double *u)
{
  int i;
  int N = width * height;
  for (i = 0; i < N; i++) 
    u[i] = (rand() % 256);
}

int main(int argc,char *argv[])
{
  int status = 0;
  int n = 256;
  int m = 256;
  if (argc == 2) {
    n = atoi(argv[1]);
    m = atoi(argv[1]);
  }
  ;
  double *input = (double *)(malloc(sizeof(double ) * n * m));
  double *result = (double *)(malloc(sizeof(double ) * n * m));
  double *result_cpu = (double *)(malloc(sizeof(double ) * n * m));
  initialize(n,m,input);
  float filter[5][5] = {/* Need explicit braces: is this where we insert the class name? */ {(0), (0), (1), (0), (0)}, /* Need explicit braces: is this where we insert the class name? */ {(0), (0), (2), (0), (0)}, /* Need explicit braces: is this where we insert the class name? */ {(3), (4), (5), (6), (7)}, /* Need explicit braces: is this where we insert the class name? */ {(0), (0), (8), (0), (0)}, /* Need explicit braces: is this where we insert the class name? */ {(0), (0), (9), (0), (0)}};
  int width = m;
  int height = n;
  double elapsed = read_timer_ms();
  double cpu_time = 0.0;
  double gpu_time = 0.0;
  int i;
  for (i = 0; i < 10; i++) {
    elapsed = read_timer_ms();
    stencil_omp_target(input,result,width,height,filter[0],5,5);
    gpu_time += read_timer_ms() - elapsed;
  }
  ;
  printf("GPU time(ms): %g\n",gpu_time / 10);
  printf("GPU total time(ms): %g\n",gpu_time);
/*
    double dif = 0;
    for (i = 0; i < width*height; i++) {
        int x = i % width;
        int y = i / width;
        if (x > FILTER_WIDTH/2 && x < width - FILTER_WIDTH/2 && y > FILTER_HEIGHT/2 && y < height - FILTER_HEIGHT/2)
            dif += fabs(result[i] - result_cpu[i]);
    }
    printf("verify dif = %g\n", dif);
    */
  free(input);
  free(result);
  return 0;
}

void stencil_omp_target(double *src,double *dst,int width,int height,float *filter,int flt_width,int flt_height)
{
  int flt_size = flt_width * flt_height;
  int N = width * height;
  int i;
  int j;
{
/* Launch CUDA kernel ... */
    int _threads_per_block_ = 1;
    int _num_blocks_ = 1;
    int64_t __device_id = 0;
    void *__host_ptr = (void *)(&OUT__2__6066__stencil_omp_target__107__id__);
    void *__args_base[] = {&width, &height, &flt_width, &flt_height, &i, &j, src, dst, filter};
    void *__args[] = {&width, &height, &flt_width, &flt_height, &i, &j, src + 0, dst + 0, filter + 0};
    int64_t __arg_sizes[] = {((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(int ) * 1)), ((int64_t )(sizeof(double ) * N)), ((int64_t )(sizeof(double ) * N)), ((int64_t )(sizeof(float ) * flt_size))};
    int64_t __arg_types[] = {33, 33, 33, 33, 33, 33, 33, 34, 33};
    int32_t __arg_num = 9;
    __tgt_target_teams(OUT__2__6066__stencil_omp_target__107__id__,__host_ptr,__arg_num,__args_base,__args,__arg_sizes,__arg_types,_num_blocks_,_threads_per_block_);
  }
}
