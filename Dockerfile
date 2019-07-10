FROM ubuntu:16.04
RUN apt-get update && apt-get install wget -y --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN touch /etc/apt/sources.list.d/pgdg.list && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main >> /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y git cron rsync postgresql-client-10 rename apt-transport-https --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN mkdir /root/pg_backup && git clone https://github.com/azemoning/pgbackrest.git /root/pg_backup
WORKDIR /root/pg_backup
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod/ xenial main" > azure.list \
    && cp ./azure.list /etc/apt/sources.list.d/ \
    && apt-key adv --keyserver packages.microsoft.com --recv-keys EB3E94ADBE1229CF
RUN apt-get update && apt-get install azcopy -y --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN chmod +x *.sh && \
    cp backupcron /etc/cron.d/ && chmod 0644 /etc/cron.d/backupcron && \
    touch /var/log/cron_backup.log /var/log/cron_delete.log