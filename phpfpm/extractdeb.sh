#!/bin/bash -e

containerID=$(docker run --detach magnetikonline/buildphpfpm)
docker cp $containerID:/root/build/php-7.0.5/php_7.0.5-1_amd64.deb .
sleep 1
docker rm $containerID
