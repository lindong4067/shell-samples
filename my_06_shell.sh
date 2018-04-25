#!/bin/bash

val=`expr 2 + 2`
echo "Total value : $val"

a=10
b=20
val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $a / $b`
echo "a / b : $val"

val=`expr $a % $b`
echo "a % b : $val"

if [ $a == $b ]
then
	echo "a is equal to b."
fi

if [ $a != $b ]
then
	echo "a is not equal to b."
fi

if [ $a -eq $b ]
then
	echo "$a -eq $b : a is equal to b."
else	
	echo "$a -eq $b : a is not equal to b."
fi

if [ $a -ne $b ]
then
	echo "$a -ne $b : a is not equal to b."
else	
	echo "$a -ne $b : a is equal to b."
fi

if [ $a -gt $b ]
then
	echo "$a -gt $b : a is greater than b."
else	
	echo "$a -gt $b : a is not greater than b."
fi

if [ $a -lt $b ]
then
	echo "$a -lt $b : a is less than b."
else	
	echo "$a -lt $b : a is not less than b."
fi

if [ $a -ge $b ]
then
	echo "$a -ge $b : a is greater or equal to b."
else	
	echo "$a -ge $b : a is greater or equal to b."
fi

if [ $a -le $b ]
then
	echo "$a -le $b : a is less or equal to b."
else	
	echo "$a -le $b : a is not less or equal to b."
fi
echo "##########"
if [ $a != $b ]
then
	echo "$a != $b : a is not equal to b."
else	
	echo "$a != $b : a is equal to b."
fi

if [ $a -lt 100 -a $b -gt 15 ]
then
	echo "$a -lt 100 -a $b -gt 15 : returns true."
else	
	echo "$a -lt 100 -a $b -gt 15 : returns false."
fi

if [ $a -lt 100 -o $b -gt 15 ]
then
	echo "$a -lt 100 -o $b -gt 15 : returns true."
else	
	echo "$a -lt 100 -o $b -gt 15 : returns false."
fi

echo "##########"
a="abc"
b="efg"
if [ $a = $b ]
then
   echo "$a = $b : a is equal to b"
else
   echo "$a = $b: a is not equal to b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a is not equal to b"
else
   echo "$a != $b: a is equal to b"
fi
if [ -z $a ]
then
   echo "-z $a : string length is zero"
else
   echo "-z $a : string length is not zero"
fi
if [ -n $a ]
then
   echo "-n $a : string length is not zero"
else
   echo "-n $a : string length is zero"
fi
if [ $a ]
then
   echo "$a : string is not empty"
else
   echo "$a : string is empty"
fi
