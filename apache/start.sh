#!/usr/bin/env bash

HTTPD_HOME=opt/ant/$ANT_VERSION ; export HTTPD_HOME
PATH=$HTTPD_HOME/bin:$PATH ; export PATH

shutdown(){
	END=1
}

case "$1" in
    '')
        trap 'shutdown' INT TERM

        $HTTPD_HOME/bin/httpd -h

        while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac