#! /bin/bash

ANS="no_answer_yet"
while [ "$ANS" = "no_answer_yet" ]; do
    echo "Enter the password for mysql root user (no space allowed)"
    read PWD 
    if [ "$PWD" != "" ]; then
        ANS=$PWD
        break;
    fi
done

echo "Your password is: $ANS"


