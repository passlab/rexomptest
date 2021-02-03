ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_70
endif

default: cubin_wrapper rose_target.c register_cubin.cpp
	#clang -g rose_target.c rose_foo.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o target.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp
	gcc -g rose_target.c rose_foo.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o target.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -Wl,--no-as-needed -lomp

cubin_wrapper: rex_lib_nvidia.cu
	nvcc -cubin -arch ${CUDA_ARCH} rex_lib_nvidia.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include

omp: target.c
	clang -g -fopenmp -fopenmp-targets=nvptx64 target.c -o target_omp.out

clean: 
	rm -rf *.o *.cubin *.out

