#!/bin/bash

if [[ $1 == "clean" ]] ; then
    for d in ./*/
    do
        CURRENT=`basename $d`
        if [[ $CURRENT != "output" && $CURRENT != "build" ]] ; then
            (cd $d && rm rose/rose_*)
            (cd $d && rm rose/rex_*)
        fi
    done
    
    echo "Done"
    exit 0
fi

## Change if your path is different
shopt -s expand_aliases
source $HOME/passlab/setup.sh

function gen_dummy() {
    echo "int main() { return 0; }" > $1
    echo "void foo() {}" >> $2
}

# Params:
# $1 -> directory
# $2 -> Name
# $3 -> Architecture
function run_rose() {
    cd "$1"
    CURRENT=$2
    ARCH=$3
    
    if [ ! -d ./rose ] ;then
        mkdir rose
    fi
    cd rose
    
    rose ../"$CURRENT"_float.c
    mv rose_"$CURRENT"_float.c rose_"$CURRENT"_float_$ARCH.c
    
    rose ../"$CURRENT"_float_p.c
    if [[ -f rex_lib.c ]] ; then
        mv rose_"$CURRENT"_float_p.c rose_"$CURRENT"_float_p_$ARCH.c
        mv rex_lib.c rex_lib_p_$ARCH.c
    else
        gen_dummy rose_"$CURRENT"_float_p_$ARCH.c rex_lib_p_$ARCH.c
    fi
    
    rose ../"$CURRENT"_float_pf.c
    if [[ -f rex_lib.c ]] ; then
        mv rose_"$CURRENT"_float_pf.c rose_"$CURRENT"_float_pf_$ARCH.c
        mv rex_lib.c rex_lib_pf_$ARCH.c
    else
        gen_dummy rose_"$CURRENT"_float_pf_$ARCH.c rex_lib_pf_$ARCH.c
    fi
    
    echo ""
    echo ""
}

for d in ./*/
do
    CURRENT=`basename $d`
    if [[ $CURRENT != "output" && $CURRENT != "build" ]] ; then
        echo $CURRENT
        (run_rose $d $CURRENT "avx512")
        (run_rose $d $CURRENT "sve")
    fi
done

echo "Done"
