# PostgreSQL Automated Backup Script on Linux

PostgreSQL Backup Script and Auto Upload to Azure Storage.

This base script forked from [Automated Backup on Linux - PostgreSQL wiki](https://wiki.postgresql.org/wiki/Automated_Backup_on_Linux)

## Usage

### Prerequisite

To use this script, you need to have Azure Storage account on Azure  
See: [Azure Storage Quickstart](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal)

Before configuring or deploying image, you need to create an account at [Healthchecks.io](https://healthcheks.io). Create new project and add check on that project.\
After adding a new check, copy **Ping URL** and replace the url at the ```curl``` command on [pg_backup.sh](https://github.com/azemoning/pgbackrest/blob/master/pg_backup.sh).

Example:

```bash
curl -fsS --retry 3 https://hc-ping.com/replace_this_with_your_own_url > /dev/null
```

After that, you can rebuild the image and then deploy it on your own project.

```bash
docker build -t pgbackup_azcopy .
```

**You need to prepare your Azure Storage Shared Access Signature (SAS) before continuing**  
See: 
- [Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview)
- [Generating SAS Token](https://docs.snowflake.net/manuals/user-guide/data-load-azure-config.html#generating-an-sas-token)

### Deploy  

Make sure to set environment variables below to use the script:

```bash
export PGSSLMODE="allow"
export PGPASSWORD="password"
export PGDB_HOST="host"
export PGDB_USERNAME="username"
export PGDB_PORT="5432"
export BLOB_URL="Storage_Resource_URI"
export BLOB_SAS="SAS_Token"
```

OR

Define on Dockerfile:

```dockerfile
ENV PGSSLMODE"allow"
ENV PGPASSWORD="password"
ENV PGDB_HOST="host"
ENV PGDB_USERNAME="username"
ENV PGDB_PORT="5432"
ENV BLOB_URL="Storage_Resource_URI"
ENV BLOB_SAS="SAS_Token"
```

And then deploy with this dockerfile

```dockerfile
FROM pgbackup_azcopy ## CHANGE WITH YOUR OWN IMAGE NAME
ENV PGSSLMODE="allow"
ENV PGPASSWORD="password"
ENV PGDB_HOST="host"
ENV PGDB_USERNAME="username"
ENV PGDB_PORT="5432"
ENV BLOB_URL="Storage_Resource_URI"
ENV BLOB_SAS="SAS_Token"
RUN env > env.env
CMD cron && tail -f /var/log/cron_backup.log
```

### Restoring backup file

Clone this repository.

```bash
git clone https://github.com/azemoning/pgbackup-azcopy.git
```

Open **pg_restore.sh** with your text editor.\
Change the value from all of environment variables according to your PostgreSQL configuration.\
Example:

```bash
export PGSSLMODE="allow" #always allow this
export PGPASSWORD="password"
export PGDB_HOST="db.example.com"
export PGDB_PORT="5432"
export PGDB_USER="foo"
export PGDB_DATABASE="foodb"
export BACKUP_FILE_NAME="foodb_backup.dump"
```

Save your configuration and then change script file permission.

```bash
chmod +x pg_restore.sh
```

Run the script with the following command

```bash
./pg_restore.sh
```

### Configuring cron schedule

To configure cron schedule, please refer to the official cron formatting.\
**Do not remove the empty line at the end of the cron file. It is required to run the cron job.**\
If there is no empty line at the file, please add by yourself.
