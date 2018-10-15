
cleanup() {
  apt-get autoremove -y
  apt-get clean all
  rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /usr/share/locale ~/.cache /preinstall.sh /install.sh /common_utils.sh
  rm -rf /postinstall.sh
}

cleanup

