#!/bin/bash

ORACLE_BASE=/opt/oracle; export ORACLE_BASE
DB_HOME=$ORACLE_BASE/product/12.1.0/dbhome_1; export DB_HOME
ORACLE_HOME=$DB_HOME; export ORACLE_HOME
PATH=$ORACLE_HOME/bin:$PATH; export PATH
