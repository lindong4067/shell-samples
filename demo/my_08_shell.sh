#!/bin/bash

your_name='lindong'
str="Hello, \"$your_name\"! \n"
str1="Hello, ${your_name}! "
echo $str $str1

string="abcd"
echo ${#string}

string="alibaba is a great company"
echo ${string:1:4}

echo `expr index "$string" com`

echo "##########"
array_name=(value0 value1 value2)
echo ${array_name[0]}
echo ${array_name[1]}
echo ${array_name[2]}

echo "##########"
NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Index: ${NAME[0]}"
echo "Second Index: ${NAME[1]}"

echo ${array_name[*]}
echo ${array_name[@]}
echo "##########"
length=${#array_name[@]}
echo ${length}
length=${#array_name[*]}
echo ${length}
lengthn=${#array_name[1]}
echo ${lengthn}
