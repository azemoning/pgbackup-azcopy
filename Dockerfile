FROM ubuntu:16.04
RUN apt-get update && apt-get install cpulimit wget -y
RUN touch /etc/apt/sources.list.d/pgdg.list && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main >> /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y git curl cron rsync postgresql-client-10 rename apt-transport-https --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN mkdir /root/pg_backup && git clone https://github.com/azemoning/pgbackup-azcopy.git /root/pg_backup
WORKDIR /root/pg_backup
RUN wget -O azcopyv10.tar https://azcopyvnext.azureedge.net/release20190703/azcopy_linux_amd64_10.2.1.tar.gz \
    && tar -xf azcopyv10.tar --strip-components=1 \
    && ./azcopy
RUN chmod +x *.sh && \
    cp backupcron /etc/cron.d/ && chmod 0644 /etc/cron.d/backupcron && \
    touch /var/log/cron_backup.log /var/log/cron_delete.log
