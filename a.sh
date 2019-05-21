#!/bin/sh


function print_log()
{
	echo `date "+%Y_%m_%d %H:%M:%S"` >> a.log 
	source /opt/consul/script/env/consul.export
	curl -k https://10.180.20.34:8088/v1/health/service/oam-fds--fdsserver | python -m json.tool >> a.log
}

int=1
while (( "$int < 10" ))
do
print_log 
sleep 1
done

date >> /root/datetime_cpu.txt
top -b -n 1 | grep Cpu  >> /root/datetime_cpu.txt
top -c -b -n 1 | grep -i  'PID USER' | grep -v 'grep' >> /root/cpu.txt
top -c -b -n 1 | grep -i 'consul agent' | grep -v 'grep' >> /root/datetime_cpu.txt
#cat /proc/loadavg | awk '{print $1,$2,$3}' >> /root/datetime_cpu.txt
echo "" >> /root/datetime_cpu.txt

