#!/usr/bin/env bash

echo "127.0.0.1 endeca" >> /etc/hosts

if [ "`ls -A /opt/endeca`" = "" ]; then
    echo "Installing Endeca workspaces."
    ln -s /usr/bin/awk /bin/awk
    ln -s /usr/bin/basename /bin/basename
    ln -s /bin/gzip /usr/bin/gzip
    unzip -q /installer/platform.zip -d /tmp
    unzip -q /installer/mdex.zip -d /tmp
    unzip -q /installer/tools.zip -d /tmp
    unzip -q /installer/cas.zip -d /tmp
    chmod +x /tmp/OCcas11.1.0-Linux64.sh
    chmod +x /tmp/OCmdex6.5.1-Linux64_829811.sh
    chmod +x /tmp/OCplatformservices11.1.0-Linux64.bin
    /tmp/OCmdex6.5.1-Linux64_829811.sh --silent --target /opt
    source /opt/endeca/MDEX/6.5.1/mdex_setup_sh.ini
    touch /tmp/platform_silent.txt
    echo "8888" > /tmp/platform_silent.txt
    echo "8090" >> /tmp/platform_silent.txt
    echo "Y" >> /tmp/platform_silent.txt
    echo "/opt/endeca/MDEX/6.5.1" >> /tmp/platform_silent.txt
    echo "Y" >> /tmp/platform_silent.txt
    touch /tmp/cas_silent.txt
    echo "8500" > /tmp/cas_silent.txt
    echo "8506" >> /tmp/cas_silent.txt
    echo "endeca" >> /tmp/cas_silent.txt
    /tmp/OCplatformservices11.1.0-Linux64.bin --silent --target /opt < /tmp/platform_silent.txt
    source /opt/endeca/PlatformServices/workspace/setup/installer_sh.ini
    chown -R developer:developer /opt/endeca
    su developer -c  "/tmp/cd/Disk1/install/runInstaller.sh -ignoreSysPrereqs -silent -waitforcompletion -responseFile /installer/tools.rsp ORACLE_HOME_NAME=ToolsAndFrameworks ORACLE_HOME=/opt/endeca/ToolsAndFrameworks PASSWORD_VALIDATION=admin"
    source /home/developer/oraInventory/orainstRoot.sh
    /tmp/OCcas11.1.0-Linux64.sh --silent --target /opt < /tmp/cas_silent.txt
    chown -R developer:developer /opt/endeca
else
    echo "Endeca has been installed."
    source /opt/endeca/MDEX/6.5.1/mdex_setup_sh.ini
    source /opt/endeca/PlatformServices/workspace/setup/installer_sh.ini
fi

sed -i '/ENDECA_TOOLS_CONF=/d' /opt/endeca/ToolsAndFrameworks/11.1.0/server/bin/workbench.sh
ENDECA_ROOT=/opt/endeca/PlatformServices/11.1.0 ; export ENDECA_ROOT
ENDECA_TOOLS_ROOT=/opt/endeca/ToolsAndFrameworks/11.1.0 ; export ENDECA_TOOLS_ROOT
ENDECA_TOOLS_CONF=$ENDECA_TOOLS_ROOT/server/workspace ; export ENDECA_TOOLS_CONF

su developer -c "$ENDECA_ROOT/tools/server/bin/startup.sh"
su developer -c "$ENDECA_TOOLS_ROOT/server/bin/startup.sh"
su developer -c "nohup /opt/endeca/CAS/11.1.0/bin/cas-service.sh < /dev/null > /opt/endeca/CAS/workspace/logs/cas-service-wrapper.log &"

shutdown(){
    su developer -c "$ENDECA_ROOT/tools/server/bin/shutdown.sh"
    su developer -c "$ENDECA_TOOLS_ROOT/server/bin/shutdown.sh"
    su developer -c "/opt/endeca/CAS/11.1.0/bin/cas-service-shutdown.sh"
	END=1
}
trap 'shutdown' INT TERM

case "$1" in
    '')
        echo "Container has been started."
		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac