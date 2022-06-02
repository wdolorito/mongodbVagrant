#!/bin/sh
sudo apt-get update &&
# installing mongodb
sudo apt-get -y install wget curl less nano mongodb nodejs &&

# securing mongodb with password
sleep 10 &&
sudo mv -f /tmp/add_mongo_admin.js /root &&
sudo chown root.root /root/add_mongo_admin.js &&
sudo mongo < /root/add_mongo_admin.js &&

# restart mongod with custom config
sudo mv -f /tmp/mongodb.conf /etc/mongodb.conf &&
sudo chown root.root /etc/mongodb.conf &&
sudo systemctl restart mongodb.service
