#!/bin/sh
# installing nodejs 12
sudo apt-get -y install curl &&
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - &&
sudo apt-get install -y nodejs build-essential &&

# update system
sleep 10 &&
mv -f /tmp/update.sh /root &&
chmod 700 /root/update.sh &&
chown root.root /root/update.sh &&
/root/update.sh
