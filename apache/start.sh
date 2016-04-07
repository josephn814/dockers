#!/usr/bin/env bash

HTTPD_HOME=/opt/apache ; export HTTPD_HOME
PATH=$HTTPD_HOME/bin:$PATH ; export PATH

shutdown(){
    sudo $HTTPD_HOME/bin/apachectl stop
	END=1
}

case "$1" in
    '')
        trap 'shutdown' INT TERM

        sudo $HTTPD_HOME/bin/apachectl start

        while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac