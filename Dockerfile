FROM microsoft/dotnet:latest
RUN apt-get update && apt-get install -y cron rsync libunwind8 postgresql-client
RUN mkdir /root/pg_backup && git clone https://github.com/azemoning/pgbackrest.git /root/pg_backup
RUN mkdir /tmp/azcopy && \
    wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopylinux64 &&  \
    tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy &&  \
    /tmp/azcopy/install.sh
RUN rm -rf /tmp/azcopy
RUN chmod +x *.sh
RUN cp backupcron /etc/cron.d/ && chmod 0644 /etc/cron.d/backupcron
WORKDIR /root/pg_backup