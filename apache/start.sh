#!/usr/bin/env bash

APACHE_HOME=/opt/apache ; export APACHE_HOME
PATH=$APACHE_HOME/bin:$PATH ; export PATH

if [ ! -r $APACHE_HOME/conf/httpd.conf ]; then
    sudo chown -R developer:developer $APACHE_HOME
fi

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
	*)
		echo "Container is starting......."
		$@
		;;
esac