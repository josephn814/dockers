#!/usr/bin/env bash

DIRECTORY=/opt/ATG

if [ "`ls -A $DIRECTORY`" = "" ]; then
    echo "Installing ATG."
    unzip /installer/installer.zip -d /installer
    chmod +x /installer/OCPlatform11.1.bin
    /installer/OCPlatform11.1.bin -i silent -f /installer/installer.properties
else
    echo "ATG has been installed."
fi

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
