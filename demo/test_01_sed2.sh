#!/bin/bash

sed 's/book/books/' myfile  #替换文件所有配置字段
sed -n 's/test/TEST/p' myfile  #只打印发生变化的行
sed -i 's/book/books/g' myfile  #修改每一行的第一个
sed 's/book/books/g' myfile  #修改每一行的所有匹配

sed 's/book/books/2g' myfile  #从第2处开始修改

# / 为定界符可以使用任意字符 sed 's|test|TEST|g'
sed 's/\/bin/\/usr\/local\/bin/g' myfile #转义字符

# 删除空白行
sed '/^$/d' myfile

# 删除文件第2行
sed '2d' myfile

# 删除文件的第二行到末尾的所有行
sed '2,$d' myfile

# 删除文件最后一行
sed '$d' myfile

# 删除文件中所有开头是test的行
sed '/^test/'d myfile

# 正则表达式\w\+ 匹配每一个单词，使用[&] 替换它，&对应于之前所匹配到的单词：
echo this is a test line | sed 's/\w\+/[&]/g'

# 以192.168.0.1开头的行都会被替换成它自已加localhost
sed 's/^192.168.0.1/&localhost/' myfile

# 子串匹配标记\1
echo this is digit 7 in a number | sed 's/digit \([0-9]\)/\1/'
echo aaa BBB | sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/'

# love被标记为1，所有loveable会被替换成lovers，并打印出来：
sed -n 's/\(love\)able/\1rs/p' myfile

# 组合多表达式

# 引用
test=hello
echo hello WORLD | sed "s/$test/HELLO"

