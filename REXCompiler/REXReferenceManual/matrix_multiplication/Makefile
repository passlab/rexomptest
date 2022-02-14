ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_70
endif

default: mm_omp

all: mm_omp mm_rex

clean: 
	rm -rf ${OBJS} *.log *.out *.cubin

mm_omp: mm_omp.c
	clang -O3 -fopenmp -fopenmp-targets=nvptx64 mm_omp.c -L${LLVM_OPENMP_INSTALL}/lib -o mm_omp.out

mm_rex: rex_lib_nvidia.cubin rose_mm_omp.c register_cubin.cpp
	clang -O3 rose_mm_omp.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o mm_rex.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp

rex_lib_nvidia.cubin: rex_lib_mm_omp.cu rex_nvidia.cu
	nvcc -O3 -cubin -arch ${CUDA_ARCH} -dlink rex_lib_mm_omp.cu rex_nvidia.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o rex_lib_nvidia.cubin

