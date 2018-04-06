#!/usr/bin/env bash

CAS_INSTALLER_FILE=/tmp/OCcas11.1.0-Linux64.bin
MDEX_INSTALLER_FILE=/tmp/OCmdex6.5.1-Linux64_829811.bin
PLATFORM_INSTALLER_FILE=/tmp/OCplatformservices11.1.0-Linux64.bin

if [ "`ls -A /opt/endeca`" = "" ]; then
    echo "Installing Endeca workspaces."
    ln -s /usr/bin/awk /bin/awk
    ln -s /usr/bin/basename /bin/basename
    ln -s /bin/gzip /usr/bin/gzip
    unzip -q /installer/platform.zip -d /tmp
    unzip -q /installer/mdex.zip -d /tmp
    unzip -q /installer/tools.zip -d /tmp
    unzip -q /installer/cas.zip -d /tmp
    chmod +x $CAS_INSTALLER_FILE
    chmod +x $MDEX_INSTALLER_FILE
    chmod +x $PLATFORM_INSTALLER_FILE
    echo "USER_INSTALL_DIR=/opt" > /tmp/mdex_silent.txt
    echo "-fileOverwrite_/opt/endeca/MDEX/6.5.1/Uninstall/Uninstall_Oracle Commerce MDEX Engine 6.5.1 x64 Edition.lax=Yes" >> /tmp/mdex_silent.txt
    $MDEX_INSTALLER_FILE -i silent -f /tmp/mdex_silent.txt
    source /opt/endeca/MDEX/6.5.1/mdex_setup_sh.ini
    echo "USER_INSTALL_DIR=/opt" > /tmp/platform_silent.txt
    echo "CHOSEN_FEATURE_LIST=PS,ACS,ACA,Ref-Impl" >> /tmp/platform_silent.txt
    echo "CHOSEN_INSTALL_FEATURE_LIST=PS,ACS,ACA,Ref-Impl" >> /tmp/platform_silent.txt
    echo "CHOSEN_INSTALL_SET=Complete" >> /tmp/platform_silent.txt
    echo "ETOOLS_HTTP_PORT=8888" >> /tmp/platform_silent.txt
    echo "ETOOLS_SERVER_PORT=8090" >> /tmp/platform_silent.txt
    echo "EAC_MDEX_ROOT=/opt/endeca/MDEX/6.5.1" >> /tmp/platform_silent.txt
    echo "-fileOverwrite_/opt/endeca/PlatformServices/11.1.0/Uninstall/Uninstall_Oracle Commerce Guided Search Platform Services 11.1.0.lax=Yes" >> /tmp/platform_silent.txt
    $PLATFORM_INSTALLER_FILE -i silent -f /tmp/platform_silent.txt
    source /opt/endeca/PlatformServices/workspace/setup/installer_sh.ini
    chown -R developer:developer /opt/endeca
	sed -i "s/host=$(hostname)/host=localhost/g" /opt/endeca/PlatformServices/workspace/conf/eaccmd.properties
    su developer -c  "/tmp/cd/Disk1/install/silent_install.sh /installer/tools.rsp ToolsAndFrameworks /opt/endeca/ToolsAndFrameworks"
    source /home/developer/oraInventory/orainstRoot.sh
    rm -f $MDEX_INSTALLER_FILE
    rm -f $PLATFORM_INSTALLER_FILE
    rm -rf /tmp/cd/
    echo "USER_INSTALL_DIR=/opt" > /tmp/cas_silent.txt
    echo "CHOSEN_FEATURE_LIST=CAS,Console,DT" >> /tmp/cas_silent.txt
    echo "CHOSEN_INSTALL_FEATURE_LIST=CAS,Console,DT" >> /tmp/cas_silent.txt
    echo "CHOSEN_INSTALL_SET=Custom" >> /tmp/cas_silent.txt
    echo "CASPORT=8500" >> /tmp/cas_silent.txt
    echo "CASSTOPPORT=8506" >> /tmp/cas_silent.txt
    echo "ENDECA_TOOLS_ROOT=/opt/endeca/ToolsAndFrameworks/11.1.0" >> /tmp/cas_silent.txt
    echo "ENDECA_TOOLS_CONF=/opt/endeca/ToolsAndFrameworks/11.1.0/server/workspace" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_/opt/endeca/CAS/11.1.0/uninstall/CAS11.1.0_uninstall/Uninstall Oracle Commerce Content Acquisition System 11.1.0.lax=Yes" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_/opt/endeca/ToolsAndFrameworks/11.1.0/server/workspace/conf/Standalone/localhost/casconsole.xml=Yes" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_/opt/endeca/ToolsAndFrameworks/11.1.0/server/webapps/casconsole-11.1.0-ssl.war=Yes" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_/opt/endeca/ToolsAndFrameworks/11.1.0/server/webapps/casconsole-11.1.0.war=Yes" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_/opt/endeca/ToolsAndFrameworks/11.1.0/server/workspace/conf/casconsole.properties=Yes" >> /tmp/cas_silent.txt
    $CAS_INSTALLER_FILE -i silent -f /tmp/cas_silent.txt
    chown -R developer:developer /opt/endeca
    chmod -R -t /opt/endeca
	sed -i "s/com.endeca.itl.cas.server.host=$(hostname)/com.endeca.itl.cas.server.host=localhost/g" /opt/endeca/CAS/workspace/conf/commandline.properties
	sed -i '/ENDECA_TOOLS_CONF=/d' /opt/endeca/ToolsAndFrameworks/11.1.0/server/bin/workbench.sh
else
    echo "Endeca has been installed."
    source /opt/endeca/MDEX/6.5.1/mdex_setup_sh.ini
    source /opt/endeca/PlatformServices/workspace/setup/installer_sh.ini
fi

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