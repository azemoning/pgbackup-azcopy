#!/bin/bash

## SET ENVIRONMENT VARIABLES
export PGSSLMODE="allow"
export PGPASSWORD="test.databas3"
export PGDB_HOST="40.90.188.178"
export PGDB_PORT="5000"
export PGDB_USER="telinmy.testing"
export PGDB_DATABASE="payment_gateway_testing"
export BACKUP_FILE_NAME="payment_gateway_testing.dump"

## START RESTORE DATABASE
pg_restore -v --no-owner --host=$PGDB_HOST --port=$PGDB_PORT --username=$PGDB_USER --dbname=$PGDB_DATABASE $BACKUP_FILE_NAME
