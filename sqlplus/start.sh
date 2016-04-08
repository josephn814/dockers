#!/usr/bin/env bash

ORACLE_HOME=/opt/sqlplus ; export ORACLE_HOME
LD_LIBRARY_PATH=$ORACLE_HOME ; export LD_LIBRARY_PATH
PATH=$ORACLE_HOME:$PATH ; export PATH

$@