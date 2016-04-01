#!/usr/bin/env bash

docker run \
    --rm \
    -v /mnt/hgfs/D/Workspaces/oracle12c:/opt/oracle/data \
    --name oracle12c \
    josedeng/oracle:oracle-12c
