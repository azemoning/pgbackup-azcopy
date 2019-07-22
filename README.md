# POSTGRESQL AUTOMATED BACKUP SCRIPT

POSTGRESQL backup script and auto upload to azure blob storage.

## Usage

### Prerequisite

Before configuring or deploying image, you need to create an account at [Healthchecks.io](https://healthcheks.io). Create new project and add check on that project.\
After adding a new check, copy **Ping URL** and replace the url at the curl command on [pg_backup.sh](https://github.com/azemoning/pgbackrest/blob/master/pg_backup.sh).

Example:

```bash

curl -fsS --retry 3 https://hc-ping.com/replace_this_with_your_own_url > /dev/null


```

After that, you can rebuild the image and then deploy it on your own project.

```bash

docker build -t pgbackup_azcopy .

```

### Deploy  

```dockerfile
FROM pgbackup_azcopy ## CHANGE WITH YOUR OWN IMAGE
ENV PGSSLMODE="allow"
ENV PGPASSWORD="password"
ENV PGDB_HOST="host"
ENV PGDB_USERNAME="username"
ENV PGDB_PORT="5432"
ENV BLOB_ACCOUNT_KEY="account-key"
ENV BLOB_LINK_CONTAINER="https://myaccount.blob.core.windows.net/mycontainer"
RUN env > env.env
CMD cron && tail -f /var/log/cron_backup.log
```

Make sure to set environment variables below to use the script:

```bash
export PGSSLMODE="allow"
export PGPASSWORD="password"
export PGDB_HOST="host"
export PGDB_USERNAME="username"
export PGDB_PORT="5432"
export BLOB_ACCOUNT_KEY="account-key"
export BLOB_LINK_CONTAINER="https://myaccount.blob.core.windows.net/mycontainer"
```

OR

Define on Dockerfile:

```dockerfile
ENV PGSSLMODE"allow"
ENV PGPASSWORD="password"
ENV PGDB_HOST="host"
ENV PGDB_USERNAME="username"
ENV PGDB_PORT="5432"
ENV BLOB_ACCOUNT_KEY="account-key"
ENV BLOB_LINK_CONTAINER="https://myaccount.blob.core.windows.net/mycontainer"

```

### Configuring cron schedule

To configure cron schedule, please refer to the official cron formatting.\
**Do not remove the empty line at the end of the cron file. It is required to run the cron job.**\
If there is no empty line at the file, please add by yourself.
