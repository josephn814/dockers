#!/usr/bin/env bash

DIRECTORY=/home/developer
export GTK_PATH=/usr/lib/x86_64-linux-gnu/gtk-2.0

if [ "`ls -A $DIRECTORY`" = "" ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

/opt/ide/bin/idea.sh
