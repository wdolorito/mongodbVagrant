#!/bin/sh
# installing mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update &&
sudo apt-get -y install mongodb-org &&
sudo systemctl enable mongod.service &&
sudo systemctl start mongod.service &&

# securing mongodb with password
sleep 10 &&
sudo mv -f /tmp/add_mongo_admin.js /root &&
sudo mv -f /tmp/update.sh /root &&
sudo chmod 700 /root/update.sh &&
sudo mongo < /root/add_mongo_admin.js &&
sudo mv -f /tmp/mongod.conf /etc/mongod.conf &&

# update system
sudo /root/update.sh &&
sudo systemctl restart mongod.service
