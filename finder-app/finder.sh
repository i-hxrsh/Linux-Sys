#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d $filesdir ]; then
    echo "Directory $filesdir does not exist"
    exit 1
fi

search_files(){

    dir=$1
    x=0
    y=0
    for file in $(ls $dir); do
        if [ -d $dir/$file ]; then
            search_files $dir/$file
        else
            x=$(($x+1))
            grep -q $searchstr $dir/$file
            if [ $? -eq 0 ]; then
               y=$(($y+1)) 
            fi
        fi
    done

    if [ $x -gt 0 ]; then
        echo "The number of files are $x and the number of matching lines are $y"
    fi
}

search_files $filesdir
