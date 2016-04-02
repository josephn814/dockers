#!/bin/bash

nohup /daemon -p 8888 -u josedeng > /dev/null 2>&1 &

case "$1" in
    '')
        /opt/ide/bin/idea.sh
        ;;
    *)
        $@
        ;;
esac