#!/bin/sh
# installing mongodb
sudo apt-get -y install gnupg &&
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add - &&
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list &&
sudo apt-get update &&
sudo apt-get -y install mongodb-org &&
sudo systemctl enable mongod.service &&
sudo systemctl start mongod.service &&

# securing mongodb with password
sleep 10 &&
sudo mv -f /tmp/add_mongo_admin.js /root &&
sudo chown root.root /root/add_mongo_admin.js &&
sudo mongo < /root/add_mongo_admin.js &&

# update system
sudo mv -f /tmp/update.sh /root &&
sudo chmod 700 /root/update.sh &&
sudo chown root.root /root/update.sh &&
sudo /root/update.sh &&

# restart mongod with custom config
sudo mv -f /tmp/mongod.conf /etc/mongod.conf &&
sudo chown root.root /etc/mongod.conf &&
sudo systemctl restart mongod.service
