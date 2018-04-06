#!/usr/bin/env bash

ROOT_HOME=/usr/local/apache2 ; export APACHE_HOME
APACHE_CONFDIR=$ROOT_HOME/conf ; export APACHE_CONFDIR

if [ ! -d $ROOT_HOME ]; then
   mkdir -p $ROOT_HOME
fi

if [ "`ls -A $ROOT_HOME`" = "" ]; then
    ln -s /usr/lib/apache2/modules $ROOT_HOME/modules
    cp -R /etc/apache2 $ROOT_HOME/conf
    mkdir -p $ROOT_HOME/{logs, htdocs}
    chown -R developer:developer $ROOT_HOME/conf $ROOT_HOME/logs $ROOT_HOME/htdocs
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
