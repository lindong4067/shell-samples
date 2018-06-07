#!/bin/bash
# 将[]替换为()
echo '[test]' | sed 's/\[/(/' | sed 's/\]/)/'

timeout 10 sleep 20 
echo 'Time out!'
