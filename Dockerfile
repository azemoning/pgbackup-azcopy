FROM microsoft/dotnet:latest
RUN touch /etc/apt/sources.list.d/pgdg.list && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main >> /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y cron rsync libunwind8 postgresql-client-10 rename
RUN mkdir /root/pg_backup && git clone https://github.com/azemoning/pgbackrest.git /root/pg_backup
RUN mkdir /tmp/azcopy && \
    wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopylinux64 &&  \
    tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy &&  \
    /tmp/azcopy/install.sh && \
    rm -rf /tmp/azcopy
WORKDIR /root/pg_backup
RUN chmod +x *.sh && \
    cp backupcron /etc/cron.d/ && chmod 0644 /etc/cron.d/backupcron && \
    touch /var/log/cron.log

#######################################
# SCRIPT BELOW IS FOR DOCKERFILE      #
# AFTER BASE IMAGE HAS BEEN BUILT     #
#######################################
# ENV PGPASSWORD="test.databas3"
# ENV PGDB_HOST="40.90.188.178"
# ENV PGDB_USERNAME="telinmy.testing"
# ENV PGDB_PORT="5000"
# RUN env > env.env
# CMD cron && tail -f /var/log/cron.log