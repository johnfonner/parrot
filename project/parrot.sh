#!/bin/bash

# Usage statement
function usageStatement() {
    echo "Usage: ${0##*/} [OPTION]..."
    echo "Prints out a file..."
    echo "                 ...parrot style"
    echo
    echo " -f <file>    File containing text to print to stdout"
    echo " -r <#>       The number of times to repeat the messag"
    echo " -h, --help   Display this help message and exit"
    echo
    exit 0
}

if [ "$#" -eq "0" ]; then usageStatement; fi

#defaults
repeat=1
infile=''

# get input arguments
while (( "$#" )); do
    case "$1" in
        -f ) infile=$2
             shift 2 ;;
        -r ) repeat=$2
             # if [ "$repeat" -lt "1" -o -z "${repeat##*[!0-9]*}" ]; then repeat=1; fi
             if [ -z "${repeat##*[!0-9]*}" ] || [ "$repeat" -lt "1" ]; then repeat=1; fi
             shift 2 ;;
        -h|-help|--help ) usageStatement ;;
        * ) usageStatement ;;
    esac
done

cat "$(dirname "${BASH_SOURCE[0]}")/header.txt"

if [ ! -e "$infile" ]; then
    echo "Parrot wants a text file!"
    exit 1
fi

for i in $(seq 1 $repeat); do
    cat $infile
done

echo
echo "Parrot wants a cracker!"

