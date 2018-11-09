#!/bin/bash

url=http://www.baidu.com
echo $url
name='Zhao Lindong'
echo $name
skill="Java"
echo "${name} is working, good at ${skill}Script."
val=$(cat my_first_shell.sh)
echo $val
echo '#'*20
readonly url
url='new test'

