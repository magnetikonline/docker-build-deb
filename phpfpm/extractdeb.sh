#!/bin/bash -e

containerID=$(docker run --detach magnetikonline/buildphpfpm)
docker cp "$containerID:/root/build/php-7.0.6/php_7.0.6-1_amd64.deb" .
sleep 1
docker rm $containerID
