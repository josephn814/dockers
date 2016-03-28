#!/bin/bash
ORACLE_BASE=/opt/oracle; export ORACLE_BASE
DB_HOME=$ORACLE_BASE/product/12.1.0/dbhome_1;export DB_HOME
ORACLE_HOME=$DB_HOME; export ORACLE_HOME
ORACLE_SID=ORCL; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$PATH; export PATH

shutdown(){
    lsnrctl stop
    echo shutdown immediate\; | sqlplus -S / as sysdba
    END=1
}

echo "SPFILE='${ORACLE_BASE}/data/dbs/spfile${ORACLE_SID}.ora'" > ${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora

lsnrctl start

if [ ! -d "/opt/oracle/data/oradata" ]; then
    echo "Creating database"
    dbca -silent -responseFile /home/oracle/dbca.rsp
else
    echo "Database already exists"
    echo startup\;  | sqlplus / as sysdba
fi

echo "Database ready to use. Enjoy! ;)"

trap 'shutdown' INT TERM

while [ "$END" == '' ]; do
    sleep 1
done
