#! /usr/bin/python

import os

os.system('docker build -t leolei2094/disconf-build ./disconf-build')

os.system('docker run -v ${PWD}/disconf-build/working:/home/work/dsp/disconf-rd/working -v ${PWD}/disconf-build/config:/home/work/dsp/disconf-rd/online-resources --name disconf-build leolei2094/disconf-build')

os.system('docker-compose -f ${PWD}/disconf-compose/docker-compose.yml up')

