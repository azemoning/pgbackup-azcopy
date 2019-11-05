#!/bin/bash

## PING HEALTHCHECKS BEFORE DELETING OLD BACKUP FILES
curl -fsS --retry 3 https://hc-ping.com/6ca8dfa3-b052-476e-b594-d549521a79e4 > /dev/null

echo -e " "
echo -e "Deleting local old backup files..."

## START DELETING OLD BACKUP FILES

find /root/pg_backup/backup_dir -name "*.sql.gz" -type f -delete
find /root/pg_backup/backup_dir -name "*.dump" -type f -delete

echo -e "Delete complete."
echo -e " "