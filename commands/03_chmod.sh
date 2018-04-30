#!/bin/bash
echo "chmod"
chmod ugo+x testfile
chmod a+r testfile
chmod ug+w,o-w testfile testfile1
chmod u+x testfile
chmod -R a+r * # 将当前目录下的所有文件y与子目录设为任何人可读
chmod 777 file 
chmod abc file

# a,b,c各为一个数字，分别表示user、group、及other的权限。
#r=4  w=2  x=1
#若rwx属性则4+2+1=7 
#若rw-属性则4+2=6 
#若r-x属性则4+1=5
chmod a=rwx file
chmod 777 file

chmod ug=rwx,o=x file
chmod 771
