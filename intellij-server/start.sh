#!/usr/bin/env bash

nohup /daemon -p 8888 -u josedeng > /tmp/daemon.log 2>&1 &

shutdown(){
   END=1
}

case "$1" in
    '')
	trap 'shutdown' INT TERM
        echo "Container Started."
		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
     *)
	echo "Container is starting......."
	$@
	;;
esac
