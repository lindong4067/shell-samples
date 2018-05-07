#!/bin/bash

test=hello
echo hello WORLD | sed "s/$test/HELLO/g"

sed -e '1,5d' -e 's/test/check/' myfile

sed '/test/r file' myfile

