#!/bin/bash

echo clear exited docker container
docker rm -v $(docker ps -a -q -f status=exited)

echo remove dangling docker images
docker rmi $(docker images -f "dangling=true" -q)
