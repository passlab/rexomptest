ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_70
endif

default: rex_lib_nvidia.cubin rose_axpy.c register_cubin.cpp
	clang -g rose_axpy.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o axpy.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp
	#gcc -g rose_axpy.c register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o target.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -Wl,--no-as-needed -lomp

clang_wrapper: rex_lib_nvidia.o rose_axpy.c
	clang -g rose_axpy.c rex_lib_nvidia.o -o axpy.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp
	#gcc -g rose_axpy.c rex_lib_nvidia.o -o target.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -Wl,--no-as-needed -lomp

rex_lib_nvidia.cubin: rex_lib_axpy.cu rex_nvidia.cu
	nvcc -rdc=true -cubin -arch ${CUDA_ARCH} -dlink rex_lib_axpy.cu rex_nvidia.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o rex_lib_nvidia.cubin

rex_lib_nvidia.o: rex_lib_nvidia.cubin
	clang-offload-wrapper rex_lib_nvidia.cubin -o rex_lib_nvidia.bc --target=x86_64-unknown-linux-gnu
	llc -filetype=obj --relocation-model=pic rex_lib_nvidia.bc

omp: axpy.c
	clang -g -fopenmp -fopenmp-targets=nvptx64 axpy.c -o axpy_omp.out

.PHONY: clean
clean: 
	rm -rf *.o *.cubin *.out *.bc

