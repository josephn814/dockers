#!/usr/bin/env bash

NODE_HOME=/opt/nodejs ; export NODE_HOME
PATH=$NODE_HOME/bin:$PATH ; export PATH

if [ "`ls -A $JBOSS_HOME`" = "" ]; then
    tar -xJf /installer.tar.xz --strip-components=1 -C $NODE_HOME
    chown -R developer:developer $NODE_HOME
fi

case "$1" in
    '')
	trap 'shutdown' INT TERM
        echo "Container Started."
		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
     *)
	echo "Container is starting......."
	$@
	;;
esac

