#!/bin/bash

for var1 in 1 2 3
do
	for var2 in 4 5 6
	do
		if [ $var1 -eq 3 -a $var2 -eq 6 ]
		then
			break 2
		else
			echo "$var1 $var2"
		fi
	done
done

while :
do
	echo -n "Input a number between 1 to 5: "
	read aNum
	case $aNum in
		1|2|3|4|5) echo "Your number is $aNum!"
		;;
		*) echo "You do not select a number between 1 to 5!"
			continue
			echo "Game is over!"
		;;
	esac
done
