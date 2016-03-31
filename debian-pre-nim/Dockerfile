FROM debian:stable
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
RUN echo deb http://http.debian.net/debian jessie-backports main contrib non-free >> /etc/apt/sources.list \
    echo deb http://http.debian.net/debian unstable main contrib non-free >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y gcc mercurial git nodejs \
    && echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config \
    && mkdir /onStart.d /onQuit.d
ADD run.sh /bin/run
