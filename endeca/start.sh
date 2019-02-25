#!/usr/bin/env bash

CAS_INSTALLER_FILE=/tmp/OCcas11_3_1_5-Linux64.bin
MDEX_INSTALLER_FILE=/tmp/OCmdex11.3.1.5-Linux64_1326782.bin
PLATFORM_INSTALLER_FILE=/tmp/OCplatformservices11.3.1.5.0-Linux64_1554774RCN.bin

ENDECA_ROOT=/opt/endeca/PlatformServices/11.3.1.5.0 ; export ENDECA_ROOT
ENDECA_CONF=/opt/endeca/PlatformServices/workspace ; export ENDECA_CONF
ENDECA_TOOLS_ROOT=/opt/endeca/ToolsAndFrameworks/11.3.1.5.0 ; export ENDECA_TOOLS_ROOT
ENDECA_TOOLS_CONF=$ENDECA_TOOLS_ROOT/server/workspace ; export ENDECA_TOOLS_CONF
ENDECA_CAS_ROOT=/opt/endeca/CAS/11.3.1.5.0 ; export ENDECA_CAS_ROOT
ENDECA_CAS_CONF=/opt/endeca/CAS/workspace ; export ENDECA_CAS_CONF
ENDECA_MDEX_ROOT=/opt/endeca/MDEX/11.3.1.5 ; export ENDECA_MDEX_ROOT

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
    echo "-fileOverwrite_$ENDECA_MDEX_ROOT/Uninstall/Uninstall_Oracle Commerce MDEX Engine 11.3.1.5 x64 Edition.lax=Yes" >> /tmp/mdex_silent.txt
    $MDEX_INSTALLER_FILE -i silent -f /tmp/mdex_silent.txt
    source $ENDECA_MDEX_ROOT/mdex_setup_sh.ini
    echo "USER_INSTALL_DIR=/opt" > /tmp/platform_silent.txt
    echo "CHOSEN_FEATURE_LIST=PS,ACS,ACA,Ref-Impl" >> /tmp/platform_silent.txt
    echo "CHOSEN_INSTALL_FEATURE_LIST=PS,ACS,ACA,Ref-Impl" >> /tmp/platform_silent.txt
    echo "CHOSEN_INSTALL_SET=Complete" >> /tmp/platform_silent.txt
    echo "ETOOLS_HTTP_PORT=8888" >> /tmp/platform_silent.txt
    echo "ETOOLS_SERVER_PORT=8090" >> /tmp/platform_silent.txt
    echo "EAC_MDEX_ROOT=$ENDECA_MDEX_ROOT" >> /tmp/platform_silent.txt
    echo "-fileOverwrite_$ENDECA_ROOT/Uninstall/Uninstall_Oracle Commerce Guided Search Platform Services 11.3.1.5.0.lax=Yes" >> /tmp/platform_silent.txt
    $PLATFORM_INSTALLER_FILE -i silent -f /tmp/platform_silent.txt
    source $ENDECA_CONF/setup/installer_sh.ini
    chown -R developer:developer /opt/endeca
	sed -i "s/host=$(hostname)/host=localhost/g" $ENDECA_CONF/conf/eaccmd.properties
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
    echo "ENDECA_TOOLS_ROOT=$ENDECA_TOOLS_ROOT" >> /tmp/cas_silent.txt
    echo "ENDECA_TOOLS_CONF=$ENDECA_TOOLS_CONF" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_$ENDECA_CAS_ROOT/uninstall/CAS11.3.1.5.0_uninstall/Uninstall Oracle Commerce Content Acquisition System 11.3.1.5.0.lax=Yes to All" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_$ENDECA_TOOLS_ROOT/server/workspace/conf/Standalone/localhost/casconsole.xml=Yes to All" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_$ENDECA_TOOLS_ROOT/server/webapps/casconsole-11.3.1.5.0-ssl.war=Yes to All" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_$ENDECA_TOOLS_ROOT/server/webapps/casconsole-11.3.1.5.0.war=Yes to All" >> /tmp/cas_silent.txt
    echo "-fileOverwrite_$ENDECA_TOOLS_ROOT/server/workspace/conf/casconsole.properties=Yes to All" >> /tmp/cas_silent.txt
    $CAS_INSTALLER_FILE -i silent -f /tmp/cas_silent.txt
    chown -R developer:developer /opt/endeca
    chmod -R -t /opt/endeca
	sed -i "s/com.endeca.itl.cas.server.host=$(hostname)/com.endeca.itl.cas.server.host=localhost/g" /opt/endeca/CAS/workspace/conf/commandline.properties
	sed -i '/ENDECA_TOOLS_CONF=/d' $ENDECA_TOOLS_ROOT/server/bin/workbench.sh
else
    echo "Endeca has been installed."
    source $ENDECA_MDEX_ROOT/mdex_setup_sh.ini
    source $ENDECA_CONF/setup/installer_sh.ini
fi

su developer -c "$ENDECA_ROOT/tools/server/bin/startup.sh"
su developer -c "$ENDECA_TOOLS_ROOT/server/bin/startup.sh"
su developer -c "nohup $ENDECA_CAS_ROOT/bin/cas-service.sh < /dev/null > $ENDECA_CAS_CONF/logs/cas-service-wrapper.log &"

shutdown(){
    su developer -c "$ENDECA_ROOT/tools/server/bin/shutdown.sh"
    su developer -c "$ENDECA_TOOLS_ROOT/server/bin/shutdown.sh"
    su developer -c "$ENDECA_CAS_ROOT/bin/cas-service-shutdown.sh"
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
