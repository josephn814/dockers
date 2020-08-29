#!/usr/bin/env bash

DIRECTORY=/home/developer
export NO_AT_BRIDGE=1

if [ "`ls -A $DIRECTORY`" = "" ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

if [ ! -r $DIRECTORY ] || [ ! -w $DIRECTORY ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

/opt/ide/bin/idea.sh
