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

clean: 
	rm -rf *.o *.cubin *.out

