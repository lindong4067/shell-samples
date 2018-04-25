#!/bin/bash

num1=100
num2=200
if test $[num1] -eq $[num2]
then
	echo 'The two numbers are equal.'
else
	echo 'The two numbers are not equal.'
fi

if test num1=num2
then
    echo 'The two strings are equal!'
else
    echo 'The two strings are not equal!'
fi

cd /bin
if test -e ./bash
then
    echo 'The file already exists!'
else
    echo 'The file does not exists!'
fi

cd /bin
if test -e ./notFile -o ./bash
then
    echo 'One file exists at least!'
else
    echo 'Both dose not exists!'
fi

cd /bin
if test -e ./notFile -a ./bash
then
    echo 'Both dose exists!'
else
    echo 'Not Both dose exists!'
fi

cd /bin
if test ! -e ./bash
then
    echo 'File dose not exists!'
else
    echo 'File dose exists!'
fi
