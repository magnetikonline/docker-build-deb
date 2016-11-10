#!/bin/bash -e

DIRNAME=$(dirname "$0")


containerID=$(docker run --detach magnetikonline/buildphpfpm)
docker cp "$containerID:/root/build/php-7.0.13/php_7.0.13-1_amd64.deb" "$DIRNAME"
sleep 1
docker rm $containerID
