#!/bin/bash

# 当version在文件中有两个的时候，取第一个
VERSION=`grep "^\s*VERSION=" awk.test | awk -F'=' '{print $2}'`

echo ${VERSION}
VERSION=`grep "^\s*VERSION=" awk.test | awk -F'=' '{print $2; exit;}'`
sleep 5
echo ${VERSION}
