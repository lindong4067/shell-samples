#!/bin/bash

printf "%d %s\n" 1 "abc"
printf '%d %s\n' 1 "abc"
printf %s abcefd
print %s asc ewkej rwree
printf "%s\n" abc wewe
printf "%s %s %s\n" a b c d e f g h j s

printf "%s and %d"
printf "*********"
a=10
b=20
if [ $a == $b ]
then
   echo "a is equal to b"
elif [ $a -gt $b ]
then
   echo "a is greater than b"
elif [ $a -lt $b ]
then
   echo "a is less than b"
else
   echo "None of the condition met"
fi
