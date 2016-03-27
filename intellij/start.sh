#!/bin/bash

nohup /opt/ide/daemon -p 8888 -u josedeng > /dev/null 2>&1 &

/opt/ide/bin/idea.sh
