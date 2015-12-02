#!/bin/bash

let "a = 0"

s="_"

if [$1 == ""] then
   echo "Usage: $0 [test file]"
   exit 1
if

for bsq in bsqs/*
do
    ./$bsq $1 > $bsq$s$a
    mv $bsq$s$a res/
    let "a = a + 1"
done
