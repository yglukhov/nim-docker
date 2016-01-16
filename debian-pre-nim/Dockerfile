FROM debian:stable
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
RUN apt-get update \
    && apt-get install -y gcc mercurial git nodejs \
    && echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config \
    && mkdir /onStart.d /onQuit.d
ADD run.sh /bin/run
