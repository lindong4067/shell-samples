#!/bin/bash

#VERSION=`/bin/grep "^\s*VERSION=" test_01_from.txt | awk -F '=' 'print $2'`
VERSION=`/bin/grep "^\s*VERSION=" test_01_from.txt | awk -F '=' '{print $2}'`
echo ${VERSION}
sed -i -e "s/\[VERSION\]/${VERSION}/g" test_01_to.txt test_02_to.txt

NODE_NAME=`/bin/grep "^\s*NODE_NAME=" test_01_from.txt | awk -F '=' '{print $2}'`
echo ${NODE_NAME}
sed -i -e "s/\[NODE_NAME\]/${NODE_NAME}/g" test_01_to.txt test_02_to.txt

CLUSTER_NAME=`/bin/grep "^\s*CLUSTER_NAME=" test_01_from.txt | awk -F '=' '{print $2}'`
echo ${CLUSTER_NAME}
sed -i -e "s/\[CLUSTER_NAME\]/${CLUSTER_NAME}/g" test_01_to.txt test_02_to.txt

PRODUCT_NAME=`/bin/grep "^\s*PRODUCT_NAME=" test_01_from.txt | awk -F '=' '{print $2}'`
echo ${PRODUCT_NAME}
sed -i -e "s/\[PRODUCT_NAME\]/${PRODUCT_NAME}/g" test_01_to.txt test_02_to.txt

