#!/bin/bash

# <prog>_serial -> This is the serial, unoptimized version
# <prog>1 -->    This is compiler-generated (generally AVX512)
# <prog>2 -->    This is forced AVX-512 (knl flag)
# <prog>_rex --> This is Rex generated
#
# Param 1- the program being run
# Param 2- the number of times to run each program
function run_intel() {
    CSV=$1".csv"
    LAST=$(($2 + 1))
    #echo "Serial,Autovec (AVX-2),Autovec (AVX-512),OMP SIMD (AVX-2),OMP SIMD (AVX-512),OMP Parallel For (AVX-2),OMP Parallel For (AVX-512),OMP SIMD/Parallel For (AVX-2),OMP SIMD/Parallel For (AVX-512),Rex (SIMD),Rex (Parallel),Rex (Parallel SIMD)" 1>> $CSV
    
    config="../intel_header.txt"
    while read -r line
    do
        printf "$line," 1>> $CSV
    done <$config
    printf "\n" >> $CSV
    
    for i in $(seq 1 $2)
    do
        ./$1/$1"_serial" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_autovec1" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_autovec2" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"1" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"2" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"1_p" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"2_p" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"1_pf" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"2_pf" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_rex" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_rex_p" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_rex_pf" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        echo "," 1>> $CSV
    done
    echo "=AVERAGE(A2:A$LAST),=AVERAGE(B2:B$LAST),=AVERAGE(C2:C$LAST),=AVERAGE(D2:D$LAST),=AVERAGE(E2:E$LAST),=AVERAGE(F2:F$LAST),=AVERAGE(G2:G$LAST),=AVERAGE(H2:H$LAST),=AVERAGE(I2:I$LAST),=AVERAGE(J2:J$LAST),=AVERAGE(K2:K$LAST),=AVERAGE(L2:L$LAST)," 1>> $CSV
}

# Arm function; this is the same as the Intel
function run_arm() {
    CSV=$1"_arm.csv"
    LAST=$(($2 + 1))
    echo "Serial,Autovec,Autovec (faddv),OMP SIMD,OMP SIMD (faddv),OMP Parallel For,OMP Parallel For (faddv),OMP SIMD/Parallel For,OMP SIMD/Parallel For (faddv),Rex (SIMD),Rex (Parallel),Rex (Parallel SIMD)" 1>> $CSV

    for i in $(seq 1 $2)
    do
        ./$1/$1"_serial" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_autovec1" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_autovec2" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"1" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"2" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"1_p" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"2_p" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"1_pf" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"2_pf" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_rex" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_rex_p" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        printf "," 1>> $CSV
        
        ./$1/$1"_rex_pf" | tr -d '\n' 1>> $CSV
        if [[ ${PIPESTATUS[0]} != 0 ]]; then
            printf "SEG" 1>> $CSV
        fi
        echo "" 1>> $CSV
    done
    echo "=AVERAGE(A2:A$LAST),=AVERAGE(B2:B$LAST),=AVERAGE(C2:C$LAST),=AVERAGE(D2:D$LAST),=AVERAGE(E2:E$LAST),=AVERAGE(F2:F$LAST),=AVERAGE(G2:G$LAST),=AVERAGE(H2:H$LAST),=AVERAGE(I2:I$LAST),=AVERAGE(J2:J$LAST),=AVERAGE(K2:K$LAST),=AVERAGE(L2:L$LAST)" 1>> $CSV
}

# Make sure we have a command line argument
if [ -z "$1" ]; then
    echo "Error: No command line argument specified."
    echo "Please enter \"intel\" or \"arm\"."
    exit 1
fi

RUNS=10
if [ ! -z "$2" ] ; then
    RUNS=$2
fi

# Run
cd build
rm ./*.csv

for d in ./*/
do
    CURRENT=`basename $d`
    if [ $CURRENT != "output" ] ; then
        echo $CURRENT
        if [[ $1 == "intel" ]] ; then
            run_intel $CURRENT $RUNS
        elif [[ $1 == "arm" ]] ; then
            run_arm $CURRENT $RUNS
        fi
    fi
done

cd ..

if [[ ! -d ./output ]]; then
    mkdir output
fi

cp build/*.csv ./output

echo "Done"

