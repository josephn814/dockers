#!/usr/bin/env bash

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    chown -R developer:developer $DIRECTORY
fi

nohup /daemon -p 8888 -u josedeng > /dev/null 2>&1 &

/opt/ide/bin/idea.sh