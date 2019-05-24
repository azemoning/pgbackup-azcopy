# POSTGRESQL AUTOMATED BACKUP SCRIPT

POSTGRESQL backup script and auto upload to azure blob storage.

## Usage

Make sure to set environment variables below to use the script:

```bash
export PGSSLMODE="allow"
export PGPASSWORD="password"
export PGDB_HOST="dbhost/ip"
export PGDB_USERNAME="user"
export PGDB_PORT="5432"
export BLOB_ACCOUNT_KEY="account-key"
export BLOB_LINK_CONTAINER="https://myaccount.blob.core.windows.net/mycontainer"
```
### OR

Define on Dockerfile:

```
ENV PGSSLMODE"allow"
ENV PGPASSWORD="password"
ENV PGDB_HOST="dbhost/ip"
ENV PGDB_USERNAME="user"
ENV PGDB_PORT="5432"
ENV BLOB_ACCOUNT_KEY="account-key"
ENV BLOB_LINK_CONTAINER="https://myaccount.blob.core.windows.net/mycontainer"

```
## Configuring cron schedule

To configure cron schedule, please refer to the official cron formatting.  
**Do not remove the empty line at the end of the cron file. It is required to run the cron job.**  
If there is no empty line at the file, please add by yourself.
