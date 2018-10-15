
apt_install() {
  while ! apt-get update; do true; done
  while ! apt-get install -y $*; do true; done
}

