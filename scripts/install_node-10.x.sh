#!/bin/sh
# installing mongodb shell
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update &&
sudo apt-get -y install mongodb-org-shell &&

# installing nodejs 10
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - &&
sudo apt-get install -y nodejs &&

# update system
sleep 10 &&
sudo mv -f /tmp/update.sh /root &&
sudo chmod 700 /root/update.sh &&
sudo /root/update.sh
