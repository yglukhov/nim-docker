FROM yglukhov/nim-ui-base
MAINTAINER Yuriy Glukhov <yuriy.glukhov@gmail.com>
RUN apt-get install -y libopenal-dev libgtk-3-dev libav-tools iceweasel default-jre-headless s3cmd \
    && echo 'Yes, do as I say!' | apt-get -t unstable install -y --force-yes libsdl2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
