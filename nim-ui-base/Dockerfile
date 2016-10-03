FROM yglukhov/nim-base
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu/
ENV DISPLAY :1.0

RUN apt-get update \
    && while ! apt-get install -y fonts-dejavu-core xvfb libsdl2-dev libx11-dev \
        libgtk-3-0 iceweasel default-jre; do true; done \
    && echo 'Xvfb :1 -screen 0 1024x768x16 +extension RANDR &' > /onStart.d/010-start-x-server.sh \
    && echo "CLEANUP" \
    && apt-get autoremove -y \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/doc \
    && rm -rf /usr/share/man \
    && rm -rf /usr/share/locale
