#!/bin/bash

check_results=`rpm -qa | grep "zlib"`
echo "command(rpm -qa) results are: $check_results"
if [[ $check_results =~ "zlib" ]] 
then 
    echo "package zlib has already installed. "
else 
    echo "This is going to install package zlib"
 fi

