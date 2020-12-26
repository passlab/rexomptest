ifeq (${LLVM_OPENMP_INSTALL},)
	LLVM_OPENMP_INSTALL := ${LLVM_PATH}
endif
ifeq (${LLVM_OPENMP_SOURCE},)
	LLVM_OPENMP_SOURCE := ${LLVM_SRC}/openmp
endif
ifeq (${CUDA_ARCH},)
	CUDA_ARCH := sm_37
endif

default: cubin_wrapper rose_target.c rex_lib_driver_target.cpp register_cubin.cpp
	clang rose_target.c rex_lib_driver_target.cpp register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o target.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -lomp
	#gcc rose_target.c rex_lib_driver_target.cpp register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -o target.out -L${LLVM_OPENMP_INSTALL}/lib -lomptarget -Wl,--no-as-needed -lomp

cubin_wrapper: rex_lib_kernel_target.cu
	nvcc -cubin -arch ${CUDA_ARCH} rex_lib_kernel_target.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include

all_in_one: all_in_one_cubin_wrapper rose_target.c rex_lib_target.cu register_cubin.cpp
	nvcc -g rose_target.c rex_lib_target.cu register_cubin.cpp -I${LLVM_OPENMP_SOURCE}/libomptarget/include -L${LLVM_OPENMP_INSTALL}/lib -o target_all_in_one.out -lomptarget -Xcompiler \"-Wl,--no-as-needed\" -Xcompiler -lomp

all_in_one_cubin_wrapper: rex_lib_target.cu
	nvcc -cubin -arch ${CUDA_ARCH} rex_lib_target.cu -I${LLVM_OPENMP_SOURCE}/libomptarget/include

omp: target.c
	clang -fopenmp -fopenmp-targets=nvptx64 target.c -o target_omp.out

clean: 
	rm -rf *.o *.cubin *.out

