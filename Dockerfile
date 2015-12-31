FROM debian:stable
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
RUN apt-get update \
    && apt-get install -y gcc git mercurial libsdl2-dev libopenal-dev libvorbis0a libogg0 nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --depth 1 https://github.com/nim-lang/nim.git \
    && cd nim \
    && ./bootstrap.sh \
    && cd -
    && git clone --depth 1 https://github.com/nim-lang/nimble.git
    && nim c -r nimble/src/nimble install -y nimble
    && echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
