#!/usr/bin/env bash

echo *****************************
echo clear exited docker container
echo *****************************
docker rm -v $(docker ps -a -q -f status=exited)

echo *****************************
echo remove dangling docker images
echo *****************************
docker rmi $(docker images -f "dangling=true" -q)
