#!/usr/bin/env bash

ORACLE_HOME=/opt/sqlplus ; export ORACLE_HOME
LD_LIBRARY_PATH=$ORACLE_HOME ; export LD_LIBRARY_PATH
PATH=$ORACLE_HOME:$PATH ; export PATH

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
		echo "Container is starting......."
		$@
		;;
esac