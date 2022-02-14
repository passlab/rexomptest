ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_70
endif

default: mv_omp

all: mv_omp mv_rex

clean: 
	rm -rf ${OBJS} *.log *.out *.cubin

mv_omp: mv_omp.c
	clang -O3 -fopenmp -fopenmp-targets=nvptx64 mv_omp.c -L${LLVM_OPENMP_INSTALL}/lib -o mv_omp.out

mv_rex: rex_lib_nvidia.cubin rose_mv_omp.c register_cubin.cpp rex_lib_mv_omp.c
	clang -O3 rose_mv_omp.c register_cubin.cpp rex_lib_mv_omp.c -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o mv_rex.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp

rex_lib_nvidia.cubin: rex_lib_mv_omp.cu rex_nvidia.cu
	nvcc -O3 -cubin -arch ${CUDA_ARCH} -dlink rex_lib_mv_omp.cu rex_nvidia.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o rex_lib_nvidia.cubin

