# 1. Introduction

### 1.1 Input
- `target.c`: `omp target parallel for` that not requires data mapping
- `Makefile`: Use Clang and nvcc to compile the output files

### 1.2 Dependencies from REX compiler
- `libxomp.h`: ROSE header required by two `.cu` helpers
- `xomp_cuda_lib.cu`: ROSE helper in CUDA for GPU offloading
- `xomp_cuda_lib_inlined.cu`: ROSE helper in CUDA for GPU offloading
- `rex_kmp.h`: REX header for using LLVM OpenMP runtime
- `register_cubin.cpp`: REX helper to register `.cubin` file

### 1.3 Original output
- `rose_target.c`: main file without outlined functions
- `rex_lib_target.cu`: outlined file having both driver and kernel

### 1.4 Manually modified output
- `rose_target.c`: nothing is changed.
- `rex_lib_driver_target.cpp`: outlined driver using `_tgt_target_teams()`, no CUDA code is involved
- `rex_lib_kernel_target.cu`: outlined kernel in CUDA

# 2. Build

So far, the single all-in-one outlined file has to be compiled completely by nvcc. The manually modified output files work on both Clang and GCC except generating the `.cubin` file.
In `Makefile`, by default Clang is used for compilation. GCC requires the additional parameter `-Wl,--no-as-needed -lomp`.
Without this specific parameter, GCC won't link `libomp.so` to the program because it doesn't directly use any functions from that library.
However, without `libomp.so`, the program will throw an error:
```bash
terminate called after throwing an instance of 'std::system_error'
  what():  Unknown error -1
Aborted (core dumped)
```
Therefore, we have to force to link the library. Clang doesn't have this issue. For the all-in-one outlined file, nvcc also requires this parameter.

To compile the separate outlined files:
```bash
make
```

To compile the all-in-one outlined file:
```bash
make all-in-one
```


# 3. Run

```bash
./target
# or ./target_all_in_one.out
```

The program will print ten times of string `Test.`. Running `nvprof` shows that the kernel runs on GPU.
The code has been tested on Fornax with NVIDIA Tesla K80, CUDA toolkit 10.1, and Clang/LLVM 10.x.

# 4. On-going work

- For now, the number of threads per block and number of blocks are set to 1024 and 256.
- The size and type of passing variables are not handled. They are always set to an empty array. It will be addressed when we implement the `map` clause.


# 5. Issues

In the original output `rex_lib_target.cu`, the first group of macro could be out of order.
```c
#endif
extern "C" {
#ifdef __cplusplus
```
If there's a global variable declaration, the order would be correct.
