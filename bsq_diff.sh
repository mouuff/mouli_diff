#!/bin/bash

for file in bsqs/*
do
    ./bsqs/$file tests/test_40 > $file diff
done
