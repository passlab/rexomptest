#!/bin/bash
source setup.sh

mkdir testing
cd testing

export PATH="$REX_ROOT/rex_build/bin:$PATH"
export TEST_PATH="$HOME/passlab/rexomptest/REXCompiler/omptests/rex-simd/simd_dev/auto-tests"

function rex_test() {
    echo ""
    echo "$1/$2"
    
    rose-compiler -rose:openmp:lowering -rose:skipfinalCompileStep --simd-target=intel-avx512 $TEST_PATH/$1/$2.c
    diff $TEST_PATH/$1/rose_$2.c rose_$2.c

    if [ $? != 0 ] ; then
        echo "Fail- $2.c"
        
        cd ..
        exit 1
    fi
}

rex_test "axpy" "axpy"
rex_test "axpy" "axpy_double"
rex_test "axpy" "axpy_int"
rex_test "axpy" "axpy_avx2"
rex_test "axpy" "axpy_int_avx2"
rex_test "axpy" "axpy_double_avx2"

rex_test "matmul" "matmul"
rex_test "matmul" "matmul_double"
rex_test "matmul" "matmul_int"
rex_test "matmul" "matmul_avx2"
rex_test "matmul" "matmul_int_avx2"
rex_test "matmul" "matmul_double_avx2"

rex_test "sum" "sum"
rex_test "sum" "sum_double"
rex_test "sum" "sum_int"
rex_test "sum" "sum_array2"
rex_test "sum" "sum_avx2"
rex_test "sum" "sum_int_avx2"
rex_test "sum" "sum_double_avx2"

rex_test "matvec" "matvec"
rex_test "matvec" "matvec_double"
rex_test "matvec" "matvec_int"

#rex_test "jacobi" "jacobi"
#rex_test "jacobi" "jacobi_avx2"

#rex_test "gather" "gather"
#rex_test "gather" "gather_avx2"
#rex_test "gather" "gather_double"
#rex_test "gather" "gather_double_avx2"
#rex_test "gather" "gather_int"
#rex_test "gather" "gather_int_avx2"

#rex_test "sparse-mv" "spmv"
#rex_test "sparse-mv" "spmv_double"
#rex_test "sparse-mv" "spmv_int"

#rex_test "scatter" "scatter"
#rex_test "scatter" "scatter_avx2"
#rex_test "scatter" "scatter_double"
#rex_test "scatter" "scatter_double_avx2"
#rex_test "scatter" "scatter_int"
#rex_test "scatter" "scatter_int_avx2"

cd ..

echo "Done"
exit 0
