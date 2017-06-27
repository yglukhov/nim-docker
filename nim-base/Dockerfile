FROM yglukhov/debian-pre-nim
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
ENV PATH $PATH:/nim/bin:/root/.nimble/bin
ENV NIM_PATCH_BRANCHES
RUN git clone https://github.com/nim-lang/nim.git \
    && cd nim \
    && git remote add yglukhov https://github.com/yglukhov/nim.git \
    && git fetch yglukhov \
    && git config --global user.email "you@example.com" \
    && git config --global user.name "Your Name" \
    && for i in $NIM_PATCH_BRANCHES; do git merge yglukhov/$i; done \
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
    && rm -rf ./nimcache ./compiler/nimcache ./csources ./dist ./.git \
    && cd ..
