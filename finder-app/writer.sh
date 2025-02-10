#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

writefile=$1
writestr=$2

dirname=$(echo $writefile | sed 's/\(.*\)\/.*/\1/')
mkdir -p $dirname
echo $writestr > $writefile
