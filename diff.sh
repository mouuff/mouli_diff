#!/bin/bash

for test_ in tests/*
do
    echo "Testing: $test_"
    ./bsq_diff.sh $test_
done
