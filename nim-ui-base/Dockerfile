FROM yglukhov/nim-base
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu/
ENV DISPLAY :1.0

RUN apt-get install -y fonts-dejavu-core xvfb \
    && echo 'Xvfb :1 -screen 0 1024x768x16 +extension RANDR &' > /onStart.d/010-start-x-server.sh
