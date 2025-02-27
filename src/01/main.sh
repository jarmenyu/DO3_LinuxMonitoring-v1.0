#!/bin/bash

if [ $# -eq 0 ]; then
    echo 'No parameter'
    exit 1
elif [ $# -ne 1 ]; then 
    echo 'Need only 1 parameter'
    exit 1
else
    if [[ $1 =~ [0-9] ]]; then 
        echo 'Need text parameter'
        exit 1
    else 
        echo "$1"
        exit 0
    fi
fi 

