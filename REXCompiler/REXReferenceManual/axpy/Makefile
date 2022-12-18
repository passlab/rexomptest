ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_70
endif

default: rex_omp

all: gcc_omp gcc_acc nv_omp nv_acc llvm_omp rex_omp

.PHONY:
clean: 
	rm -rf ${OBJS} *.log *.out *.cubin

gcc_omp: axpy_omp.c
	gcc -O3 -fopenmp axpy_omp.c -o gcc_omp.out

gcc_acc: axpy_acc.c
	gcc -O3 -fopenacc axpy_acc.c -o gcc_acc.out

nv_omp: axpy_omp.c
	nvc -O3 -mp=gpu axpy_omp.c -o nv_omp.out

nv_acc: axpy_acc.c
	nvc -O3 -acc axpy_acc.c -o nv_acc.out

llvm_omp: axpy_omp.c
	clang -O3 -fopenmp -fopenmp-targets=nvptx64 axpy_omp.c -L${LLVM_OPENMP_INSTALL}/lib -o llvm_omp.out

rex_omp: rex_lib_nvidia.cubin rose_axpy_omp.c register_cubin.cpp
	clang -O3 -g rose_axpy_omp.c register_cubin.cpp -o rex_omp.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp

.PHONY:
# nvcc from CUDA 11.5 only officially supports GCC 11 or older. To use GCC 12, `-allow-unsupported-compiler` has to be specified.
rex_lib_nvidia.cubin: rex_lib_axpy_omp.cu rex_nvidia.cu
	nvcc -allow-unsupported-compiler -O3 -rdc=true -cubin -arch ${CUDA_ARCH} -dlink rex_lib_axpy_omp.cu rex_nvidia.cu -o rex_lib_nvidia.cubin

rex_acc: rex_lib_nvidia_acc.cubin rose_axpy_acc.c register_cubin.cpp
	clang -O3 -g rose_axpy_acc.c register_cubin.cpp -o rex_acc.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp

.PHONY:
rex_lib_nvidia_acc.cubin: rex_lib_axpy_acc.cu rex_nvidia.cu
	nvcc -allow-unsupported-compiler -O3 -rdc=true -cubin -arch ${CUDA_ARCH} -dlink rex_lib_axpy_acc.cu rex_nvidia.cu -o rex_lib_nvidia.cubin

