#include "axpy.h"
#include <cublas_v2.h>
#include <stdio.h>

__global__ 
void
axpy_cudakernel_warmingup(REAL* x, REAL* y, int n, REAL a)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) y[i] += a*x[i];
}

__global__ 
void
axpy_cudakernel_1perThread(REAL* x, REAL* y, int n, REAL a)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) y[i] += a*x[i];
}

/* block distribution of loop iteration */
__global__ 
void axpy_cudakernel_block(REAL* x, REAL* y, int n, REAL a) {
	int thread_num = threadIdx.x + blockIdx.x * blockDim.x;
	int total_threads = gridDim.x * blockDim.x;

	int block_size = n / total_threads; //dividable, TODO handle non-dividiable later
	
	int start_index = thread_num * block_size;
	int stop_index = start_index + block_size;
	int i;
        for (i=start_index; i<stop_index; i++) {
		if (i < n) y[i] += a*x[i];
	}
}

/* cyclic distribution of loop distribution */
__global__
void axpy_cudakernel_cyclic(REAL* x, REAL* y, int n, REAL a) {
	int thread_num = threadIdx.x + blockIdx.x * blockDim.x;
	int total_threads = gridDim.x * blockDim.x;
	
	int i;
	for (i=thread_num; i<n; i+=total_threads) { 
		if (i < n) y[i] += a*x[i];
	}
}

void axpy_cuda(REAL* x, REAL* y, int n, REAL a) {
  REAL *d_x, *d_y;
  cudaMalloc(&d_x, n*sizeof(REAL));
  cudaMalloc(&d_y, n*sizeof(REAL));

  cudaMemcpy(d_x, x, n*sizeof(REAL), cudaMemcpyHostToDevice);
  cudaMemcpy(d_y, y, n*sizeof(REAL), cudaMemcpyHostToDevice);

  cublasHandle_t cublasHandle;
  cublasStatus_t cublasStatus;

  // cuBLAS AXPY
  double elapsed = read_timer_ms();

  cublasStatus = cublasCreate(&cublasHandle);
  if (cublasStatus != CUBLAS_STATUS_SUCCESS)
    fprintf(stderr, "error %i\n", cublasStatus);

  cublasStatus = cublasDaxpy(cublasHandle, n, &a, d_x, 1, d_y, 1);

  elapsed = read_timer_ms() - elapsed;
  kernel_time += elapsed;

  cudaMemcpy(y, d_y, n*sizeof(REAL), cudaMemcpyDeviceToHost);
  cudaFree(d_x);
  cudaFree(d_y);
}

