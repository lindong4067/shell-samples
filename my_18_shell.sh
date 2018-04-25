#!/bin/bash

hello () {
	echo "http://www.baidu.com"
}

hello

funWithReturn(){
	echo "The function is to get the sum of two numbers..."
	echo -n "Input first numbers:"
	read aNum
	echo -n "Input another numbers:"
	read anotherNum
	echo "The two numbers are $aNum and $anotherNum !"
	return $(($aNum+$anotherNum))
}

funWithReturn

ret=$?
echo "The sum of two numbers is $ret !"

number_one(){
	echo "Hello World!"
	number_two
}

number_two(){
	echo "Hello Shell! "
}

number_one

# shan chu han shu
$unset .f function_name

