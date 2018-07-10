#!/bin/sh
# installing mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5 &&
echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse' | tee /etc/apt/sources.list.d/mongodb-org.list &&
apt-get update &&
apt-get -y install mongodb-org &&
systemctl enable mongod.service &&
systemctl start mongod.service &&

# securing mongodb with password
sleep 10 &&
mv -f /tmp/add_mongo_admin.js /root &&
mv -f /tmp/update.sh /root &&
mongo < /root/add_mongo_admin.js &&
mv -f /tmp/mongod.conf /etc/mongod.conf &&

# update system
/root/update.sh &&
systemctl restart mongod.service
