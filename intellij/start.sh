#!/bin/bash

nohup /opt/ide/start -p 8080 -u josedeng > /dev/null 2>&1 &

/opt/ide/bin/idea.sh
