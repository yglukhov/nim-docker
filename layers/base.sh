
# SCRIPT

apt_install gcc g++ mercurial git libssl-dev curl gnupg make
# Install nodejs 15
curl -sL https://deb.nodesource.com/setup_15.x | bash
apt_install nodejs

echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
mkdir /onStart.d /onQuit.d

echo '#!/bin/sh
for I in $(ls /onStart.d)
do
    . /onStart.d/$I
done

# Run the command
sh -c "$*"
EXIT_CODE=$?

for I in $(ls /onQuit.d)
do
    . /onQuit.d/$I
done

exit $EXIT_CODE
' > /bin/run

chmod +x /bin/run

apt-get remove -y curl

