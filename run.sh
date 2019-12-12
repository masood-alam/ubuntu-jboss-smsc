#!/bin/bash
./stop.sh
docker run -it --name ubuntu-jboss-smsc --net mynet123 --ip 172.18.0.3 -v /home/masood/ubuntu-jboss-smsc/data:/opt/jboss-5.1.0.GA/server/default/data -v /home/masood/ubuntu-jboss-smsc/data:/opt/jboss-5.1.0.GA/server/default/log -d ubuntu-jboss-smsc


