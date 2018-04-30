#!/bin/bash

#每行按空格或TAB分割，输出第一项，第四项
awk '{print $1,$4}' awk.test

# 格式化输出
awk '{printf "%-8s %-10s\n",$1,$4}' awk.test

# -F 指定分割字符
awk -F, '{print $1,$2}' awk.test

# 先使用空格分隔，分割结果再使用“，”分割
awk -F '[ ,]' '{print $1,$2,$5}' awk.test

# awk -v 设置变量
awk -va=1 '{print $1,$1+a}' awk.test

# 过滤第一列大于2的行
awk '$1>2' awk.test

# f过滤第一列等于2的行
awk '$1==2 {print $1,$3}' awk.test

# 过滤第一列大于2并且第二列等于‘Are’的行
awk '$1>2 && $2=="Are" {print $1,$2,$3}' awk.test

# 输出第二列包含“th”,并打印第二列与第四列
awk '$2 ~ /th/ {print $2,$4}' awk.test

# 模式取反
awk '$2 !~ /th/ {print $2,$4}' awk.test
awk '!/th/ {print $2,$4}' awk.test
