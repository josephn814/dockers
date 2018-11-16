#!/usr/bin/env bash

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

export SVGA_VGPU10=0
/opt/jprofiler/bin/jprofiler.sh
