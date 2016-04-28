#!/usr/bin/env bash

DIRECTORY=/opt/ATG
INSTALLER_FILE=/installer/OCPlatform11_2.bin

if [ "`ls -A $DIRECTORY`" = "" ]; then
    echo "Installing ATG."
    sudo chown -R developer:developer $DIRECTORY
    unzip /installer/installer.zip -d /installer
    chmod +x $INSTALLER_FILE
    $INSTALLER_FILE -i silent -f /installer/installer.properties
    chmod -R -t $DIRECTORY
else
    echo "ATG has been installed."
fi

shutdown(){
	END=1
}

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
