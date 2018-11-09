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
