#!/usr/bin/expect

set timeout 10
set host [lindex $argv 0]
set port [lindex $argv 1]

set ip 12035
spawn scp -P $ip /home/eznlzhi/.ssh/id_rsa.pub root@10.170.7.194:/root/.ssh/id_rsa.pub.1006
#expect "yes/no"
#send "yes\r"
expect "*Password:"
send "Root#mps000\r"
expect "*#"
spawn ssh -p $ip root@10.170.7.194
#expect "yes/no"
#send "yes\r"
expect "*Password:"
send "Root#mps000\r"
expect "*#"
send "cat /root/.ssh/id_rsa.pub.1006 >> /root/.ssh/authorized_keys\r"
expect "*#"
send "rm /root/.ssh/id_rsa.pub.1006\r"
expect "*#"
