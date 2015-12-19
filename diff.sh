#!/bin/bash

for test_ in tests/*
do
    echo "Testing: $test_"
    ./single_diff.sh $test_
done
