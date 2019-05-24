# POSTGRESQL AUTOMATED BACKUP SCRIPT

POSTGRESQL backup script and auto upload to azure blob storage.

## Usage

Make sure to set environment variables below to use the script:

```bash
export PGSSLMODE="allow"
export PGPASSWORD=""
export PGDB_HOST=""
export PGDB_USERNAME=""
export PGDB_PORT=""
export BLOB_ACCOUNT_KEY=""
export BLOB_LINK_CONTAINER="https://myaccount.blob.core.windows.net/mycontainer"
```
### OR

Define on Dockerfile:

```
ENV PGSSLMODE"allow"
ENV PGPASSWORD=""
ENV PGDB_HOST=""
ENV PGDB_USERNAME=""
ENV PGDB_PORT=""
ENV BLOB_ACCOUNT_KEY=""
ENV BLOB_LINK_CONTAINER="https://myaccount.blob.core.windows.net/mycontainer"

```
## Configuring cron schedule

To configure cron schedule, please refer to the official cron formatting.  
**Do not remove the empty line at the end of the cron file. It is required to run the cron job.**  
If there is no empty line at the file, please add by yourself.
