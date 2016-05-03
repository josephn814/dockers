#!/usr/bin/env bash

DIRECTORY=/opt/ATG
PLATFORM_INSTALLER_FILE=/installer/OCPlatform11.1.bin
ACC_INSTALLER_FILE=/installer/OCACC11.1.bin

if [ "`ls -A $DIRECTORY`" = "" ]; then
    echo "Installing ATG."
    sudo chown -R developer:developer $DIRECTORY
    unzip /installer/Platform.zip -d /installer
    unzip /installer/ACC.zip -d /installer
    chmod +x $PLATFORM_INSTALLER_FILE $ACC_INSTALLER_FILE
    $PLATFORM_INSTALLER_FILE -i silent -f /installer/installer.properties
    $ACC_INSTALLER_FILE -i silent -f /installer/installer.properties
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
