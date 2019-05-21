#!/bin/bash

top -c -b -n 1 | grep -i  'PID USER' | grep -v 'grep' >> /root/consul.txt

while [ true ]; do
	/bin/sleep 1
	cpu=`top -b -n 1 | grep Cpu`
	echo -n $cpu >> /root/cpu.txt
	echo -n "    " >> /root/cpu.txt
	date >> /root/cpu.txt
	echo "" >> /root/cpu.txt
	
	mem=`top -b -n 1 | grep Mem`
	echo -n $mem >> /root/mem.txt
	echo -n "    " >> /root/mem.txt
	date >> /root/mem.txt
	echo "" >> /root/mem.txt
	
	consul=`top -c -b -n 1 | grep -i 'consul agent' | grep -v 'grep'`
	echo -n $consul >> /root/consul.txt
	echo -n "    " >> /root/consul.txt
	date >> /root/consul.txt
	echo "" >> /root/consul.txt
done

