#!/bin/bash

containerID=$(docker run --detach magnetikonline/buildphpfpm)
docker cp $containerID:/root/build/php-5.6.16/php_5.6.16-1_amd64.deb .
sleep 1
docker rm $containerID
