FROM yglukhov/debian-jessie-pre-nim
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
RUN git clone --depth 1 https://github.com/nim-lang/nim.git \
    && cd nim \
    && git clone --depth 1 https://github.com/nim-lang/csources.git \
    && cd csources \
    && sh build.sh \
    && cd .. \
    && nim c koch \
    && ./koch boot -d:release \
    && ./koch nimble \
    && echo echo nim version: $(git rev-parse HEAD) > /onStart.d/005-nim-version.sh \
    && chmod +x /onStart.d/005-nim-version.sh \
    && cd ./dist/nimble \
    && echo echo nimble version: $(git rev-parse HEAD) > /onStart.d/006-nimble-version.sh \
    && chmod +x /onStart.d/006-nimble-version.sh \
    && cd ../.. \
    && rm -rf ./nimcache ./compiler/nimcache ./csources ./dist \
    && cd ..
