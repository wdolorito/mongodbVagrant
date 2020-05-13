#!/bin/sh
# installing mongodb 4.2 shell
sudo apt-get -y install gnupg &&
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add - &&
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list &&
sudo apt-get update &&
sudo apt-get -y install mongodb-org-shell &&

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
