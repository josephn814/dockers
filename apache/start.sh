#!/usr/bin/env bash

HTTPD_HOME=/opt/apache ; export HTTPD_HOME
PATH=$HTTPD_HOME/bin:$PATH ; export PATH

shutdown(){
    sudo apachectl stop
	END=1
}

case "$1" in
    '')
        trap 'shutdown' INT TERM

        sudo apachectl start

        while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac