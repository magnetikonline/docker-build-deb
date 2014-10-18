#!/bin/bash

containerID=`sudo docker run -d magnetikonline/buildxdebug`
sudo docker cp $containerID:/root/build/xdebug-2.2.5/xdebug_2.2.5-1_amd64.deb .
sleep 2
sudo docker rm $containerID
