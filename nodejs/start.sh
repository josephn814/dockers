#!/usr/bin/env bash

NODE_HOME=/opt/node-v5.10.1 ; export NODE_HOME
PATH=$NODE_HOME/bin:$PATH ; export PATH

shutdown(){
	END=1
}

trap 'shutdown' INT TERM

case "$1" in
    '')
        $NODE_HOME/bin/node --version

		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting."
		$@
		;;
esac