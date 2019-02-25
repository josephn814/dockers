#!/usr/bin/env bash

JAVA_HOME=/opt/jdk1.7.0_80 ; export JAVA_HOME
JAVA_VM=$JAVA_HOME/bin/java ; export JAVA_VM
DYNAMO_HOME=/opt/ATG/home ; export DYNAMO_HOME
CLASSPATH=.:$JAVA_HOME/lib ; export CLASSPATH

DIRECTORY=/opt/ATG
PLATFORM_INSTALLER_FILE=/installer/OCPlatform11_3_1.bin
ACC_INSTALLER_FILE=/installer/OCACC11_3_1.bin


if [ "`ls -A $DIRECTORY`" = "" ]; then
    echo "Installing ATG."
    sudo chown -R developer:developer $DIRECTORY
    unzip /installer/Platform.zip -d /installer
    unzip /installer/ACC.zip -d /installer
    chmod +x $PLATFORM_INSTALLER_FILE $ACC_INSTALLER_FILE
    $PLATFORM_INSTALLER_FILE -i silent -f /installer/installer.properties
    $ACC_INSTALLER_FILE -i silent -f /installer/installer.properties
    sed -i '/-Djava.naming.factory.url.pkgs=atg.jndi.url/ a\           -Datg.dynamoclientlauncher.allowremote=true \\' /opt/ATG/home/bin/startACC
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
	'acc')
        $DYNAMO_HOME/bin/startACC
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac
