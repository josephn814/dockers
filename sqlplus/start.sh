#!/usr/bin/env bash

ORACLE_HOME=/opt/sqlplus ; export ORACLE_HOME
PATH=$ORACLE_HOME:$PATH ; export PATH

$@