#!/bin/bash

let "a = 0"

s="_"
RED='\033[0;31m'
NC='\033[0m'

if [ -z "$1" ]
then
    echo "No argument supplied"
    exit 1
fi

rm -rf res
mkdir res

for bsq in bsqs/*
do
    ./$bsq $1 > $bsq$s$a
    mv $bsq$s$a res/
    let "a = a + 1"
done

tmp=
dff="diff_file"

for res in res/*
do
    if [ "$tmp" != "" ]
    then
	echo "TESTING: $res $tmp"
        diff $res $tmp > $dff
	if [ -s "$dff" ]
	then
	    echo -e "${RED}DIFF $res $tmp${NC}"
	    cat $dff >> diff
	fi
    fi
    tmp=$res
done

rm $dff
