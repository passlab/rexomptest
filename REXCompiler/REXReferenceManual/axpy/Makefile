ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_37
endif

default: axpy.out

all: axpy.out axpy_omp.out axpy_cuda.out axpy_cublas.out

axpy.out: cubin_wrapper rose_axpy.c register_cubin.cpp
	clang rose_axpy.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o axpy.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp
	#gcc rose_axpy.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o target.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -Wl,--no-as-needed -lomp

cubin_wrapper: rex_lib_axpy.cu
	nvcc -cubin -arch ${CUDA_ARCH} rex_lib_axpy.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include

axpy_omp.out: axpy.c
	clang -fopenmp -fopenmp-targets=nvptx64 axpy_omp.c -o axpy_omp.out

axpy_cuda.out: axpy_cuda.c axpy_cudakernel.cu
	nvcc axpy_cuda.c axpy_cudakernel.cu -o axpy_cuda.out

axpy_cublas.out: axpy_cuda.c axpy_cublas.cu
	nvcc axpy_cuda.c axpy_cublas.cu -o axpy_cublas.out -lcublas

.PHONY: clean
clean: 
	rm -rf *.o *.cubin *.out

