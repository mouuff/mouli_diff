#!/bin/bash

let "a = 0"

for bsq in bsqs/*
do
    ./$bsq tests/test_40 > $a
    let "a = a + 1"
done