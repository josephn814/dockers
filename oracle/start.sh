#!/bin/bash

ORACLE_BASE=/opt/oracle; export ORACLE_BASE
DB_HOME=$ORACLE_BASE/product/12.1.0/dbhome_1; export DB_HOME
ORACLE_HOME=$DB_HOME; export ORACLE_HOME
ORACLE_SID=ORCL; export ORACLE_SID
ORACLE_DATA_HOME=/opt/oracle/data ; export ORACLE_DATA_HOME
DUMPFILE_DIR=$ORACLE_BASE/admin/ORCL/dpdump
PATH=$ORACLE_HOME/bin:$PATH; export PATH

shutdown(){
    lsnrctl stop
    echo shutdown immediate\; | sqlplus -S / as sysdba
	END=1
}

echo "SPFILE='${ORACLE_DATA_HOME}/dbs/spfile${ORACLE_SID}.ora'" > ${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora

lsnrctl start
if [ ! -d "${ORACLE_DATA_HOME}/oradata" ]; then
    echo "***** Creating database *****"
    sudo chown -R oracle:oinstall ${ORACLE_DATA_HOME}
    dbca -silent -responseFile /home/oracle/dbca.rsp
else
    echo "***** Database already exists *****"
    echo startup\;  | sqlplus / as sysdba
fi
if [ ! -d "$DUMPFILE_DIR" ]; then
    mkdir -p ${DUMPFILE_DIR}
fi
echo "***** Database ready to use. Enjoy! ;) *****"
echo

trap 'shutdown' INT TERM

case "$1" in
    '')
        echo "Container Started."
        while [ "$END" == '' ]; do
            sleep 1
        done
        ;;
    *)
        echo "Container is starting."
        $@
        ;;
esac
