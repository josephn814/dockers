#!/usr/bin/env bash

docker run \
    -it \
    --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /mnt/hgfs/D/Workspaces/ide:/home/developer \
    -v /mnt/hgfs/D/Workspaces:/workspaces \
    josedeng/intellij:intellij-2016.1U