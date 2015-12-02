#!/bin/bash

let "a = 0"

s="_"

if [ -z "$1" ]
then
    echo "No argument supplied"
    exit 1
fi

rm -rf res
mkdir res

for bsq in bsqs/*
do
    ./$bsq {$1} > $bsq$s$a
    mv $bsq$s$a res/
    let "a = a + 1"
done

for res in res/*
do
    echo $res
done
