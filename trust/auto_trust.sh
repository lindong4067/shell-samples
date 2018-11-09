#!/usr/bin/expect
spawn scp -P 12049 /home/eznlzhi/.ssh/id_rsa.pub root@10.170.7.194:/root/.ssh/id_rsa.pub.1006
expect "*Password:"
send "Root#mps000\r"

