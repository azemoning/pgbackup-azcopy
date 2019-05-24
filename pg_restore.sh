#!/bin/bash

## SET ENVIRONMENT VARIABLES
export PGSSLMODE="allow"
export PGPASSWORD="password"
export PGDB_HOST="host"
export PGDB_PORT="5432"
export PGDB_USER="user"
export PGDB_DATABASE="db"
export BACKUP_FILE_NAME="backup.dump"

## START RESTORE DATABASE
pg_restore -v --no-owner --host=$PGDB_HOST --port=$PGDB_PORT --username=$PGDB_USER --dbname=$PGDB_DATABASE $BACKUP_FILE_NAME