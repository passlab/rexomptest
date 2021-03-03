ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_37
endif

default: rose_schedule.c
	clang -g rose_schedule.c rex_lib_schedule.c -o schedule.out -L${LLVM_OPENMP_INSTALL}/lib -lomp

omp: schedule.c
	clang -g -fopenmp schedule.c -o schedule_omp.out

clean: 
	rm -rf *.o *.cubin *.out

