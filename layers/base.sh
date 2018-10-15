
# SCRIPT

apt_install gcc g++ mercurial git libssl-dev curl gnupg
# Install nodejs 10
curl -sL https://deb.nodesource.com/setup_10.x | bash
apt_install nodejs

echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
mkdir /onStart.d /onQuit.d

cat << EOF > /bin/run
#!/bin/sh
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
EOF
chmod +x /bin/run

apt-get remove -y curl

