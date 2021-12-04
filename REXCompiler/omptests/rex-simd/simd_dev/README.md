The test for the development in progress of SIMD transformation by Patrick

### Arm Compile Flags
For serial/omp version: `armclang -mcpu=a64fx -armpl -fopenmp -march=armv8-a+sve axpy_float.c -o axpy_armcompiler`

For Rex-generated version: `armclang -march=armv8.2-a+sve -fopenmp rose_axpy_float_sve.c -o axpy_sve`
