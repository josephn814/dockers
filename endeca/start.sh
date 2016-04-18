#!/usr/bin/env bash

ENDECA_MDEX_ROOT=/opt/endeca/MDEX/6.5.1 ; export ENDECA_MDEX_ROOT
PATH=$ENDECA_MDEX_ROOT/bin:$PATH ; export PATH

ENDECA_ROOT=/opt/endeca/PlatformServices/11.1.0 ; export ENDECA_ROOT
PERLLIB=$ENDECA_ROOT/lib/perl:$ENDECA_ROOT/lib/perl/Control:$ENDECA_ROOT/perl/lib:$ENDECA_ROOT/perl/lib/site_perl:$PERLLIB ; export PERLLIB
PERL5LIB=$ENDECA_ROOT/lib/perl:$ENDECA_ROOT/lib/perl/Control:$ENDECA_ROOT/perl/lib:$ENDECA_ROOT/perl/lib/site_perl:$PERL5LIB ; export PERL5LIB
PATH=$ENDECA_ROOT/bin:$ENDECA_ROOT/perl/bin:$ENDECA_ROOT/utilities:$PATH ; export PATH

ENDECA_TOOLS_ROOT=/opt/endeca/ToolsAndFrameworks/11.1.0 ; export ENDECA_TOOLS_ROOT

ENDECA_CONF=/opt/endeca/PlatformServices/workspace ; export ENDECA_CONF
ENDECA_REFERENCE_DIR=/opt/endeca/PlatformServices/reference ; export ENDECA_REFERENCE_DIR
ENDECA_TOOLS_CONF=$ENDECA_TOOLS_ROOT/server/workspace ; export ENDECA_TOOLS_CONF

sed -i '/ENDECA_TOOLS_CONF=/d' /opt/endeca/ToolsAndFrameworks/11.1.0/server/bin/workbench.sh

if [ "`ls -A /opt/endeca`" = "" ]; then
    echo "Installing Endeca workspaces."
    unzip -q /tmp/V45999-01.zip -d /tmp
    unzip -q /tmp/V46002-01.zip -d /tmp
    unzip -q /tmp/V46387-01.zip -d /tmp
    unzip -q /tmp/V46393-01.zip -d /tmp
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
    echo "localhost" >> /tmp/cas_silent.txt
    /tmp/OCplatformservices11.1.0-Linux64.bin --silent --target /opt < /tmp/platform_silent.txt
    source /opt/endeca/PlatformServices/workspace/setup/installer_sh.ini
    su developer -c  "/tmp/cd/Disk1/install/runInstaller.sh -ignoreSysPrereqs -silent -waitforcompletion -responseFile /tmp/tools.rsp ORACLE_HOME_NAME=ToolsAndFrameworks ORACLE_HOME=/opt/endeca/ToolsAndFrameworks PASSWORD_VALIDATION=admin"
    source /home/endeca/oraInventory/orainstRoot.sh
    /tmp/OCcas11.1.0-Linux64.sh --silent --target /opt < /tmp/cas_silent.txt
    chown -R developer:developer /opt/endeca
else
    echo "Endeca has been installed."
fi

$ENDECA_ROOT/tools/server/bin/startup.sh
$ENDECA_TOOLS_ROOT/server/bin/startup.sh
nohup $CAS_ROOT/bin/cas-service.sh < /dev/null > $CAS_WORKSPACE/logs/cas-service-wrapper.log &