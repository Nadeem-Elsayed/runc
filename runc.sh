#!/bin/bash
#Nadeem Elsayed
#October 27, 2024
#This program runs a C file

#defines the usage of the program
usage() {
        echo "usage:">&2
        echo "runc "file"">&2
        echo "runc "file" "file.c"">&2
}

if [[ $# == 1 && -z $1 ]]
then
        echo "No C file specified"
        usage
elif [[ $# == 1 && -n $1 && -f $1.c ]]
then
        gcc -o $1 $1.c
        $1
elif [[ $# == 1 && -n $1 ]]
then
        echo "$1.c Not found">&2
        usage
elif [[ $# == 2 && -n $1 && -n $2 && -f $2 ]]
then
        gcc -o $1 $2
        $1
        elif [[ $# == 0 ]]
then
        echo "Not enough arguments">&2
        usage
else
        echo "you're doing something wrong">&2
        usage
fi