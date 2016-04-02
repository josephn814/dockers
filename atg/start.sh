#!/usr/bin/env bash

shutdown(){
	END=1
}

case "$1" in
    '')
		trap 'shutdown' INT TERM

		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is started."
		$@
		;;
esac
