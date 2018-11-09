#!/usr/bin/expect

set timeout 10
set host [lindex $argv 0]
set port [lindex $argv 1]

spawn scp -P 10039 /home/eznlzhi/.ssh/id_rsa.pub root@10.170.7.173:/root/.ssh/id_rsa.pub.1006
send "/bin/tcsh "
expect {
    -re \"*yes/no*\" {exp_send \"yes\r\"}
    -re \"*Password:\" {exp_send \"Root#mps000\r\"}
}

#expect "yes/no"
#send "yes\r"
#expect "*Password:"
#send "Root#mps000\r"
expect "*#"
spawn ssh -p 10039 root@10.170.7.173
expect{
    -re "yes/no" {exp_send "yes\r"}
    -re "*Password:" {exp_send "Root#mps000\r"}
}

#expect "yes/no"
#send "yes\r"
#expect "*Password:"
#send "Root#mps000\r"
expect "*#"
send "cat /root/.ssh/id_rsa.pub.1006 >> /root/.ssh/authorized_keys\r"
expect "*#"
send "rm /root/.ssh/id_rsa.pub.1006\r"
expect "*#"
