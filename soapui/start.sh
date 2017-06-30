#!/usr/bin/env bash

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

if [ ! -d "/home/developer/soapui_link" ]; then
    sudo ln -s /opt/soapui/ /home/developer/soapui_link
fi

/opt/soapui/bin/soapui.sh
