ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu/
ENV DISPLAY :1.0

# SCRIPT

apt_install fonts-dejavu-core xvfb libsdl2-dev libx11-dev libgtk-3-0 iceweasel default-jre
echo 'Xvfb :1 -screen 0 1024x768x16 +extension RANDR &' > /onStart.d/010-start-x-server.sh

