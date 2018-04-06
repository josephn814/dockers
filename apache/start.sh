#!/usr/bin/env bash

APACHE_HOME=/usr/lib/apache2 ; export APACHE_HOME
APACHE_CONFDIR=$APACHE_HOME/conf ; export APACHE_CONFDIR

if [ "`ls -A $APACHE_HOME`" = "" ]; then
    ln -s /usr/lib/apache2/modules $APACHE_HOME/modules
    cp -R /etc/apache2 $APACHE_HOME/conf
fi


shutdown(){
    sudo apachectl stop
	END=1
}

case "$1" in
    '')
        trap 'shutdown' INT TERM
        echo "Container Started."
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
