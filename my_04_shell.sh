#!/bin/bash

echo $0
echo $1
echo $#
echo $*
echo $@
echo $?
echo $$
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo '##########'
for var in "$*"
do
    echo "$var"
done
echo '##########'
for var in "$@"
do
    echo "$var"
done
