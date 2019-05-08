FROM microsoft/dotnet:latest
RUN apt-get update && apt-get install -y cron rsync libunwind8
RUN mkdir /tmp/azcopy && \
    wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopylinux64 &&  \
    tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy &&  \
    /tmp/azcopy/install.sh
RUN rm -rf /tmp/azcopy
