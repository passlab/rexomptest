ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_70
endif

default: stencil_omp

all: stencil_omp stencil_rex

clean: 
	rm -rf ${OBJS} *.log *.out *.cubin

stencil_omp: stencil_omp.c
	clang -O3 -fopenmp -fopenmp-targets=nvptx64 stencil_omp.c -L${LLVM_OPENMP_INSTALL}/lib -o stencil_omp.out

stencil_rex: rex_lib_nvidia.cubin rose_stencil_omp.c register_cubin.cpp rex_lib_stencil_omp.cu
	clang -O3 rose_stencil_omp.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o stencil_rex.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp

rex_lib_nvidia.cubin: rex_lib_stencil_omp.cu rex_nvidia.cu
	nvcc -O3 -cubin -arch ${CUDA_ARCH} -dlink rex_lib_stencil_omp.cu rex_nvidia.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o rex_lib_nvidia.cubin

