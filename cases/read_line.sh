#!/bin/bash

if [[ "$1" == "" ]]
then
  echo "Please input file name!"
  exit 1
fi


while read line
do
  let count++
  echo "$count $line"
done < $1
