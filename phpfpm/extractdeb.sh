#!/bin/bash -e

DIRNAME=$(dirname "$0")


containerID=$(docker run --detach magnetikonline/buildphpfpm)
docker cp "$containerID:/root/build/php-7.0.12/php_7.0.12-1_amd64.deb" "$DIRNAME"
sleep 1
docker rm $containerID
