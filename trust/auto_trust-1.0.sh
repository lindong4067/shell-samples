#!/usr/bin/expect

set timeout 10
set host [lindex $argv 0]
set port [lindex $argv 1]

spawn scp -P ${port} /home/eznlzhi/.ssh/id_rsa.pub root@${host}:/root/.ssh/id_rsa.pub.1006
#expect "yes/no"
#send "yes\r"
expect "*Password:"
send "Root#mps000"
send "\r\n"
expect "*#"
spawn ssh -p ${port} root@${host}
#expect "yes/no"
#send "yes\r"
expect "*Password:"
send "Root#mps000\r\n"
send "\r"
expect "*#"
send "cat /root/.ssh/id_rsa.pub.1006 >> /root/.ssh/authorized_keys\r"
expect "*#"
send "rm /root/.ssh/id_rsa.pub.1006\r"
expect "*#"
