#!/usr/bin/env bash

if [ $# -gt 0 ]; then
    for f in "$@"
    do
        eval $f
    done
fi

if [ "x$WORKSPACES" = "x" ]; then
    WORKSPACES=/mnt/hgfs/D/Workspaces
fi

if [ "x$PROJECT_NAME" = "x" ]; then
    PROJECT_NAME=.
fi

if [ ! "x$VOLUMES_FROMS" = "x" ]; then
    for _volumes_from in $VOLUMES_FROMS
    do
        VOLUMES_FROM="$VOLUMES_FROM --volumes-from $_volumes_from"
    done
fi

if [ ! "x$LINKS" = "x" ]; then
    for _link in $LINKS
    do
        LINK="$LINK --link $_link"
    done
fi

if [ ! "x$EXPOSES" = "x" ]; then
    for _expose in $EXPOSES
    do
        EXPOSE="$EXPOSE --expose $_expose"
    done
fi

if [ ! "x$MOUNTS" = "x" ]; then
    for _mount in $MOUNTS
    do
        MOUNT="$MOUNT -v $_mount"
    done
fi

docker run \
    -it \
    --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $WORKSPACES/$PROJECT_NAME/ide:/home/developer \
    -v $WORKSPACES/$PROJECT_NAME:/workspaces \
    $VOLUMES_FROM $LINK $EXPOSE $MOUNT\
    josedeng/intellij:intellij-2016.1
