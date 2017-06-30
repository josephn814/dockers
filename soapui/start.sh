#!/usr/bin/env bash

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

touch /opt/soapui/bin/soapui.properties
echo "soapui.logroot=/home/developer/" >> /opt/soapui/bin/soapui.properties
/opt/soapui/bin/soapui.sh
