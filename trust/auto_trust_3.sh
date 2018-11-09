#!/usr/bin/expect

spawn scp -P 10031 /home/eznlzhi/.ssh/id_rsa.pub root@10.170.7.173:/root/.ssh/id_rsa.pub.1006
expect "yes/no"
send "yes\r"
expect "*Password:"
send "Root#mps000\r"
expect "*#"
spawn ssh -p 10031 root@10.170.7.173
expect "*Password:"
send "Root#mps000\r"
expect "*#"
send "cat /root/.ssh/id_rsa.pub.1006 >> /root/.ssh/authorized_keys\r"
expect "*#"
send "rm /root/.ssh/id_rsa.pub.1006\r"
expect "*#"
