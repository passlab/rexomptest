ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_70
endif

default: axpy_omp

all: axpy_omp axpy_rex

clean: 
	rm -rf ${OBJS} *.log *.out *.cubin

axpy_omp: axpy_omp.c
	clang -O3 -fopenmp -fopenmp-targets=nvptx64 axpy_omp.c -L${LLVM_OPENMP_INSTALL}/lib -o axpy_omp.out

axpy_rex: rex_lib_nvidia.cubin rose_axpy_omp.c register_cubin.cpp
	clang -O3 -g rose_axpy_omp.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o axpy_rex.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp

rex_lib_nvidia.cubin: rex_lib_axpy_omp.cu rex_nvidia.cu
	nvcc -O3 -rdc=true -cubin -arch ${CUDA_ARCH} -dlink rex_lib_axpy_omp.cu rex_nvidia.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o rex_lib_nvidia.cubin

rex_acc: rex_lib_nvidia_acc.cubin rose_axpy_acc.c register_cubin.cpp
	clang -O3 -g rose_axpy_acc.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o rex_acc.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp

.PHONY:
rex_lib_nvidia_acc.cubin: rex_lib_axpy_acc.cu rex_nvidia.cu
	nvcc -O3 -rdc=true -cubin -arch ${CUDA_ARCH} -dlink rex_lib_axpy_acc.cu rex_nvidia.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o rex_lib_nvidia.cubin

