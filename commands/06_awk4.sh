#!/bin/bash
echo -e '\n01'
awk '$3>0 {print $1,$2*$3}' emp.data
echo -e '\n02'
awk '$3==0 {print $1}' emp.data
echo -e '\n03'
# ,会显示空格，空格隔开不显示空格
awk '$2==0 {print $1,$2,$3}' file1 file2
echo -e '\n04'
awk '{print}' emp.data 
echo -e "\n05"
# NF 字段数量,打印每一行数量，第一个字段的值，最后一个字段的值。
awk '{print NF, $1, $NF}' emp.data 
echo -e '\n06'
# 计算和打印
awk '{print NF, $1, $NF}' emp.data 
