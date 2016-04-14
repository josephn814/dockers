#!/usr/bin/env bash

NODE_HOME=/opt/node-v4.4.3 ; export NODE_HOME
PATH=$NODE_HOME/bin:$PATH ; export PATH

shutdown(){
	END=1
}

case "$1" in
    '')
        trap 'shutdown' INT TERM

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