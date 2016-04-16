#!/usr/bin/env bash

echo "******************************"
echo "remove exited docker container"
echo "******************************"
docker rm -v $(docker ps -a -qf status=exited)
echo
echo "******************************"
echo "remove dangling docker images "
echo "******************************"
docker rmi $(docker images -qf dangling=true)
echo
echo "******************************"
echo "remove dangling docker volumes"
echo "******************************"
docker volume rm $(docker volume ls -qf dangling=true)
