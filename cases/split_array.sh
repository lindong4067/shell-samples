#!/bin/bash

# 逗号分隔字符串
function split() {
 hosts="[135.252.247.113,135.252.247.65,135.252.247.66]"
 hosts=${hosts#[}
 hosts=${hosts%]}
 OLD_IFS="$IFS" 
 IFS="," 
 arr=($hosts) 
 IFS="$OLD_IFS"
 for ip in ${arr[*]}
 do
     echo -e "check $ip"
     if [ '135.252.247.65' = $ip ];then
         echo $ip
         break;
     fi
 done
}

# 找到安装目录
function home(){
    cd `dirname $0`
    cd ..
    HOME=`pwd`
    echo $HOME
}

