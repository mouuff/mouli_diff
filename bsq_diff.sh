#!/bin/bash

let "a = 0"

s = "_"

for bsq in bsqs/*
do
    ./$bsq tests/test_40 > $bsq$s$a
    mv $bsq$s$a res/
    let "a = a + 1"
done
