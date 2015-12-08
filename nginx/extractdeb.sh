#!/bin/bash =e

containerID=$(docker run --detach magnetikonline/buildnginx)
docker cp $containerID:/root/build/nginx-1.8.0/nginx_1.8.0-1_amd64.deb .
sleep 1
docker rm $containerID
