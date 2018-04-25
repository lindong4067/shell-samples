#!/bin/bash

file="/g/Download/demo/my_06_shell.sh"

if [ -r $file ]
then
	echo "File has read access"
else
	echo "File does not have read access"
fi
if [ -w $file ]
then
	echo "File has write permission"
else
	echo "File does not have write permission"
fi
if [ -x $file ]
then
	echo "File has execute permission"
else
	echo "File does not have execute permission"
fi
if [ -f $file ]
then
	echo "File is an ordinary file"
else
	echo "File is sepcial file"
fi
if [ -d $file ]
then
	echo "File is a directory"
else
	echo "File is not a directory"
fi
if [ -s $file ]
then
	echo "File size is not zero"
else
	echo "File size is zero"
fi
if [ -e $file ]
then
	echo "File exist"
else
	echo "File does not exist"
fi
