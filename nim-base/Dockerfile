FROM yglukhov/debian-pre-nim
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
ADD run.sh /onStart.d/005-nim-version.sh
RUN git clone --depth 1 https://github.com/nim-lang/nim.git \
    && cd nim \
    && git clone --depth 1 https://github.com/nim-lang/csources.git \
    && cd csources \
    && sh build.sh \
    && cd .. \
    && nim c koch \
    && ./koch boot -d:release \
    && cd .. \
    && git clone --depth 1 https://github.com/nim-lang/nimble.git \
    && nim c -r nimble/src/nimble install -y nimble \
    && rm -rf ./nim/nimcache ./nim/compiler/nimcache ./nim/csources ./nimble
