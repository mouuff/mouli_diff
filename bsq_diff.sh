#!/bin/bash

for file in bsqs/*
do
    ./$file tests/test_40 > $file diff
done
