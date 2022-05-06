#!/bin/bash

#Params
#1 -> config
#2 -> CSV
function generate_csv_line() {
    config=$1
    CSV=$2
    while read -r line
    do
        printf "$line," 1>> $CSV
    done <$config
    printf "\n" >> $CSV
}

# Params
#1 -> config
#2 -> CSV
#3 -> last
function generate_average_line() {
    config=$1
    CSV=$2
    LAST=$3
    
    ascii=65
    while read -r line
    do
        letter=$(echo "$ascii" | awk '{ printf("%c", $0); }')
        printf "=AVERAGE(" 1>> $CSV
        printf $letter 1>> $CSV
        printf "2:$letter" 1>> $CSV
        printf "$LAST" 1>> $CSV
        printf ")," 1>> $CSV
        ascii=$((ascii+1))
    done <$config
    printf "\n" >> $CSV
}

# Params
#1 -> program
#2 -> prefix
#3 -> CSV
function run_program() {
    ./$1/$1"$2" | tr -d '\n' 1>> $3
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        printf "SEG" 1>> $3
    fi
    printf "," 1>> $3
}

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
    
    config="../intel.txt"
    generate_csv_line $config $CSV
    
    for i in $(seq 1 $2)
    do
        run_program $1 "_serial" $CSV
        run_program $1 "_autovec1" $CSV
        run_program $1 "_autovec2" $CSV
        run_program $1 "1" $CSV
        run_program $1 "2" $CSV
        run_program $1 "1_p" $CSV
        run_program $1 "2_p" $CSV
        run_program $1 "1_pf" $CSV
        run_program $1 "2_pf" $CSV
        run_program $1 "_rex" $CSV
        run_program $1 "_unroll_rex" $CSV
        run_program $1 "_rex_p" $CSV
	    run_program $1 "_rex_pf" $CSV

	    echo "" 1>> $CSV
    done
    
    config="../intel.txt"
    generate_average_line $config $CSV $LAST
}

# Arm function; this is the same as the Intel
function run_arm() {
    CSV=$1"_arm.csv"
    LAST=$(($2 + 1))
    #echo "Serial,Autovec,Autovec (faddv),OMP SIMD,OMP SIMD (faddv),OMP Parallel For,OMP Parallel For (faddv),OMP SIMD/Parallel For,OMP SIMD/Parallel For (faddv),Rex (SIMD),Rex (Parallel),Rex (Parallel SIMD)" 1>> $CSV
    
    config="../arm.txt"
    generate_csv_line $config $CSV

    for i in $(seq 1 $2)
    do
        run_program $1 "_serial" $CSV
        run_program $1 "_autovec1" $CSV
        run_program $1 "_autovec2" $CSV
        run_program $1 "1" $CSV
        run_program $1 "2" $CSV
        run_program $1 "1_p" $CSV
        run_program $1 "2_p" $CSV
        run_program $1 "1_pf" $CSV
        run_program $1 "2_pf" $CSV
        run_program $1 "_rex" $CSV
        run_program $1 "_rex_unroll" $CSV
        run_program $1 "_rex_p" $CSV
        run_program $1 "_rex_pf" $CSV
        
        echo "" 1>> $CSV
    done
    echo #"=AVERAGE(A2:A$LAST),=AVERAGE(B2:B$LAST),=AVERAGE(C2:C$LAST),=AVERAGE(D2:D$LAST),=AVERAGE(E2:E$LAST),=AVERAGE(F2:F$LAST),=AVERAGE(G2:G$LAST),=AVERAGE(H2:H$LAST),=AVERAGE(I2:I$LAST),=AVERAGE(J2:J$LAST),=AVERAGE(K2:K$LAST),=AVERAGE(L2:L$LAST)" 1>> $CSV
    
    config="../arm.txt"
    generate_average_line $config $CSV $LAST
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

