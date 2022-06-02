#!/bin/sh
# installing nodejs 10
sudo apt-get -y install curl &&
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - &&
sudo apt-get install -y nodejs &&

# update system
sleep 10 &&
sudo mv -f /tmp/update.sh /root &&
sudo chmod 700 /root/update.sh &&
sudo /root/update.sh
