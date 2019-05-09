#!/bin/bash
azcopy \
	--source /root/pg_backup/backup_dir \
	--destination $BLOB_LINK_CONTAINER \
	--dest-key $BLOB_ACCOUNT_KEY \
	--recursive