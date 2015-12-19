#!/bin/bash

let "a = 0"

s="_"
RED='\033[0;31m'
BLUE='\033[1;32m'
NC='\033[0m'

if [ -z "$1" ]
then
    echo "No argument supplied"
    exit 1
fi

rm -rf res
mkdir res

for exec_ in execs/*
do
    ./$exec_ $1 > $exec_$s$a
    mv $exec_$s$a res/
    let "a = a + 1"
done

tmp=
dff="diff_file"

for res in res/*
do
    if [ "$tmp" != "" ]
    then
        diff $res $tmp > $dff
	if [ -s "$dff" ]
	then
	    echo -e "${RED}DIFF $res $tmp${NC}"
	    cat $dff >> diff
	else
	    echo -e "${BLUE}OK $res $tmp${NC}"
	fi
    fi
    tmp=$res
done

rm $dff
