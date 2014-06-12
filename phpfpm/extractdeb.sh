#!/bin/bash

containerID=`sudo docker run -d magnetik/buildphpfpm`
sudo docker cp $containerID:/root/build/php-5.5.13/php_5.5.13-1_amd64.deb .
sleep 1
sudo docker rm $containerID
