#!/bin/bash

# This function builds the Arm kernels
# param 1: The directory to CD to
# param 2: The name of the kernel we are building
function build_arm() {
    cd "$1"
    CURRENT=$2
    
    echo ""
    echo $CURRENT
    echo ""
    
    # Serial
    armclang -lm -O0 "$CURRENT"_serial.c -o ../build/$CURRENT/$CURRENT"_serial"
    armclang -lm -O2 -march=armv8-a+sve "$CURRENT"_serial.c -o ../build/$CURRENT/$CURRENT"_autovec1"
    armclang -lm -O2 -march=armv8-a+sve -ffp-model=fast "$CURRENT"_serial.c -o ../build/$CURRENT/$CURRENT"_autovec2"
    
    # OpenMP SIMD
    armclang -fopenmp -O2 -lm -march=armv8-a+sve "$CURRENT"_float.c -o ../build/$CURRENT/$CURRENT"1"
    armclang -fopenmp -O2 -lm -march=armv8-a+sve -ffp-model=fast "$CURRENT"_float.c -o ../build/$CURRENT/$CURRENT"2"
    
    # OpenMP SIMD Parallel for
    #armclang -fopenmp -O2 -lm -march=armv8-a+sve "$CURRENT"_float_p.c -o ../build/$CURRENT/$CURRENT"1_p"
    #armclang -fopenmp -O2 -lm -march=armv8-a+sve -ffp-model=fast "$CURRENT"_float_p.c -o ../build/$CURRENT/$CURRENT"2_p"
    
    # OpenMP SIMD Parallel for with SIMD
    #armclang -fopenmp -O2 -lm -march=armv8-a+sve "$CURRENT"_float_pf.c -o ../build/$CURRENT/$CURRENT"1_pf"
    #armclang -fopenmp -O2 -lm -march=armv8-a+sve -ffp-model=fast "$CURRENT"_float_pf.c -o ../build/$CURRENT/$CURRENT"2_pf"
    
    # Rex Builds
    armclang -fopenmp -O2 -lm -march=armv8-a+sve rose/rose_"$CURRENT"_float_sve.c -o ../build/$CURRENT/$CURRENT"_rex"
    armclang -fopenmp -O2 -lm -march=armv8-a+sve rose/rose_"$CURRENT"_float_unroll_sve.c -o ../build/$CURRENT/$CURRENT"_unroll_rex"
    #armclang -fopenmp -O2 -lm -march=armv8-a+sve rose/rose_"$CURRENT"_float_p_sve.c rose/rex_lib_p_sve.c -o ../build/$CURRENT/$CURRENT"_rex_p"
    #armclang -fopenmp -O2 -lm -march=armv8-a+sve rose/rose_"$CURRENT"_float_pf_sve.c rose/rex_lib_pf_sve.c -o ../build/$CURRENT/$CURRENT"_rex_pf"
}

# Build on the Intel platform
#
# Syntax the same as above
function build_intel() {
    cd "$1"
    CURRENT=$2
    
    # Serial
    clang-12 -lm -O0 "$CURRENT"_serial.c -o ../build/$CURRENT/$CURRENT"_serial"
    clang-12 -lm -O2 -march=native "$CURRENT"_serial.c -o ../build/$CURRENT/$CURRENT"_autovec1"
    clang-12 -lm -O2 -march=knl "$CURRENT"_serial.c -o ../build/$CURRENT/$CURRENT"_autovec2"
    
    # OpenMP SIMD
    clang-12 -fopenmp -O2 -lm -march=native "$CURRENT"_float.c -o ../build/$CURRENT/$CURRENT"1"
    clang-12 -fopenmp -O2 -lm -march=knl "$CURRENT"_float.c -o ../build/$CURRENT/$CURRENT"2"
    
    # OpenMP SIMD Parallel for
    #clang-12 -fopenmp -O2 -lm -march=native "$CURRENT"_float_p.c -o ../build/$CURRENT/$CURRENT"1_p"
    #clang-12 -fopenmp -O2 -lm -march=knl "$CURRENT"_float_p.c -o ../build/$CURRENT/$CURRENT"2_p"
    
    # OpenMP SIMD Parallel for with SIMD
    #clang-12 -fopenmp -O2 -lm -march=native "$CURRENT"_float_pf.c -o ../build/$CURRENT/$CURRENT"1_pf"
    #clang-12 -fopenmp -O2 -lm -march=knl "$CURRENT"_float_pf.c -o ../build/$CURRENT/$CURRENT"2_pf"
    
    # Rex builds
    clang-12 -fopenmp -O2 -lm -march=native rose/rose_"$CURRENT"_float_avx512.c -o ../build/$CURRENT/$CURRENT"_rex"
    clang-12 -fopenmp -O2 -lm -march=native rose/rose_"$CURRENT"_float_avx2.c -o ../build/$CURRENT/$CURRENT"_rex2"
    clang-12 -fopenmp -O2 -lm -march=native rose/rose_"$CURRENT"_float_unroll_avx512.c -o ../build/$CURRENT/$CURRENT"_unroll_rex"
    clang-12 -fopenmp -O2 -lm -march=native rose/rose_"$CURRENT"_float_unroll_avx2.c -o ../build/$CURRENT/$CURRENT"_unroll_rex2"
    #clang-12 -fopenmp -O2 -lm -march=native rose/rose_"$CURRENT"_float_p_avx512.c rose/rex_lib_p_avx512.c -o ../build/$CURRENT/$CURRENT"_rex_p"
    #clang-12 -fopenmp -O2 -lm -march=native rose/rose_"$CURRENT"_float_pf_avx512.c rose/rex_lib_pf_avx512.c -o ../build/$CURRENT/$CURRENT"_rex_pf"
}

if [ -z "$1" ]; then
    echo "Error: No command line argument specified."
    echo "Please enter \"intel\" or \"arm\"."
    exit 1
fi

if [ -d ./build ] ; then
    rm -rf ./build
fi

# If we have intel, go through each folder and call the Intel build scripts
if [[ $1 == "intel" ]] ; then
    for d in ./*/
    do
        CURRENT=`basename $d`
        if [ $CURRENT != "output" ] ; then
            echo $CURRENT
            mkdir -p build/$CURRENT
            touch build/$CURRENT/rex_kmp.h
            (build_intel $d $CURRENT)
        fi
    done

# Otherwise, do that for Arm
elif [[ $1 == "arm" ]] ; then
    for d in ./*/
    do
        CURRENT=`basename $d`
        if [ $CURRENT != "output" ] ; then
            echo $CURRENT
            mkdir -p build/$CURRENT
            touch build/$CURRENT/rex_kmp.h
            (build_arm $d $CURRENT)
        fi
    done
    
# Otherwise, syntax error!
else
    echo "Error: Invalid architecture."
    echo "Please enter \"intel\" or \"arm\"."
    exit 1
fi

echo "Done!"
