#!/usr/bin/env bash

declare -A DEPENDENCIES

DEPENDENCIES["atg11.1"]="josedeng/atg:atg-11.1"
DEPENDENCIES["gradle2.12"]="josedeng/gradle:gradle-2.12"

for DOCKER_ALIAS in "${!DEPENDENCIES[@]}" ; do
    DOCKER_IMAGE="${DEPENDENCIES["$DOCKER_ALIAS"]}"
    if [ "x$(docker ps -a | grep "${DOCKER_ALIAS}")" = "x" ]; then
        nohup docker run --name $DOCKER_ALIAS $DOCKER_IMAGE > /dev/null 2>&1 &
    else
        nohup docker start $DOCKER_ALIAS > /dev/null 2>&1 &
    fi
done

shutdown(){
    for DOCKER_ALIAS in "${!DEPENDENCIES[@]}" ; do
        DOCKER_IMAGE="${DEPENDENCIES["$DOCKER_ALIAS"]}"
        docker stop $DOCKER_ALIAS > /dev/null 2>&1
        docker rm -v $DOCKER_ALIAS > /dev/null 2>&1
    done
    END=1
}

trap "shutdown" INT TERM

echo "Environments have been started. Please using CTRL+C to quit."

while [ "x$END" = "x" ]; do
    sleep 1
done