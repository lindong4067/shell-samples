#!/usr/bin/python

import sys, time

for i in range(100):
	sys.stdout.write('%s/100\r' % (i + 1))
	sys.stdout.flush()
	time.sleep(0.1)
