#!/bin/bash

ORACLE_BASE=/opt/oracle; export ORACLE_BASE
DB_HOME=$ORACLE_BASE/product/12.1.0/dbhome_1; export DB_HOME
ORACLE_HOME=$DB_HOME; export ORACLE_HOME
ORACLE_SID=ORCL; export ORACLE_SID
ORACLE_DATA_HOME=/opt/oracle/data ; export ORACLE_DATA_HOME
DPUMPDIR=$ORACLE_DATA_HOME/dump ; export DPUMPDIR
DATA_PUMP_DIR=DPUMPDIR ; export DATA_PUMP_DIR
PATH=$ORACLE_HOME/bin:$PATH; export PATH

shutdown(){
    lsnrctl stop
    echo shutdown immediate\; | sqlplus -S / as sysdba
	END=1
}

echo "SPFILE='${ORACLE_DATA_HOME}/dbs/spfile${ORACLE_SID}.ora'" > ${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora
if [ ! -d $DPUMPDIR ]; then
    mkdir -p $DPUMPDIR
if

lsnrctl start
if [ ! -d "${ORACLE_DATA_HOME}/oradata" ]; then
    echo "***** Creating database *****"
    dbca -silent -responseFile /home/oracle/dbca.rsp
    echo "create or replace directory  $DATA_PUMP_DIR as  '$DPUMPDIR'" | sqlplus / as sysdba
    echo "grant read,write on directory $DATA_PUMP_DIR to sys" | sqlplus / as sysdba
else
    echo "***** Database already exists *****"
    echo startup\;  | sqlplus / as sysdba
fi
echo "***** Database ready to use. Enjoy! ;) *****"
echo

trap 'shutdown' INT TERM

case "$1" in
    '')
        while [ "$END" == '' ]; do
            sleep 1
        done
        ;;
    *)
        echo "Container is starting."
        $@
        ;;
esac
