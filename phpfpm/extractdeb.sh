#!/bin/bash

containerID=$(docker run -d magnetikonline/buildphpfpm)
docker cp $containerID:/root/build/php-5.6.14/php_5.6.14-1_amd64.deb .
sleep 1
docker rm $containerID
