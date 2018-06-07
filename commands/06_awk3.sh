#!/bin/bash

awk -F % 'NR>=7&&NR<=15 {print $1 $3 $7}' myfile
