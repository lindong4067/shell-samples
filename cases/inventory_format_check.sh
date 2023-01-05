#!/bin/bash

CHRE=`xmllint --format $1 2>&1 > /dev/null`
ERR="parser error"
if [[ $CHRE == *$ERR* ]]
then
  echo "The file format is incorrect: $1"
else
  echo "The file format is correct $1"
fi

