FROM debian:stable
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
ADD run.sh /bin/run
RUN echo deb http://http.debian.net/debian jessie-backports main contrib non-free >> /etc/apt/sources.list \
    && while ! apt-get update; do true; done \
    && while ! apt-get install -y gcc mercurial git nodejs; do true; done \
    && echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config \
    && mkdir /onStart.d /onQuit.d \
    && echo "CLEANUP" \
    && apt-get autoremove -y \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/doc \
    && rm -rf /usr/share/man \
    && rm -rf /usr/share/locale
