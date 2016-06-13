#!/usr/bin/env bash

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

/opt/soapui/bin/soapui.sh