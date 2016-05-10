#!/usr/bin/env bash

APACHE_HOME=/opt/apache ; export APACHE_HOME
PATH=$APACHE_HOME/bin:$PATH ; export PATH

shutdown(){
    sudo $APACHE_HOME/bin/apachectl stop
	END=1
}

case "$1" in
    '')
        trap 'shutdown' INT TERM
        echo "Container Started."
        sudo $APACHE_HOME/bin/apachectl start

        while [ "$END" == '' ]; do
			sleep 1
		done
		;;
    'help')
        echo "Cat $APACHE_HOME/conf/httpd.conf"
        cat $APACHE_HOME/conf/httpd.conf
        ;;
	*)
		echo "Container is starting......."
		$@
		;;
esac