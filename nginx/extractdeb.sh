#!/bin/bash

containerID=`sudo docker run -d magnetikonline/buildnginx`
sudo docker cp $containerID:/root/build/nginx-1.6.1/nginx_1.6.1-1_amd64.deb .
sleep 1
sudo docker rm $containerID
