FROM microsoft/dotnet:latest
RUN mkdir /tmp/azcopy && \
    wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopyprlinux &&  \
    tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy &&  \
    /tmp/azcopy/install.sh
RUN rm -rf /tmp/azcopy
RUN apt-get update && apt-get install -y cron