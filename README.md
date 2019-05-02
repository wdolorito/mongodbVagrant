# Simple Vagrantfile for mongodb community edition 4.0 and nodejs 10

### Required software

- [Virtualbox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

### Files in 'scripts' dir:
- add_mongo_admin.js
- install_mongodb-4.0.sh
- install_node-10.x.sh
- mongod.conf
- update.sh

### How to customize
The admin user and password can be changed in add_mongo_admin.js.  Inside the main Vagrantfile, the private ip address can be changed as well as the hostname of the VM and the name that appears in VirtualBox Manager. `Important: if the private ip is changed, be sure to add the requisite change to mongod.conf bindIp.` mongodb is bound by default to localhost and the static ip 192.168.10.200.

### How to use nodejs box
The mongo shell will have been installed after bringing up the nodejs box.

```sh
cd nodejs
vagrant up
vagrant ssh
```

Connect to running mongodb server and authenticate (assuming default values)

```sh
mongo --host 192.168.15.200 --port 27017
# after entering shell
use admin
db.auth("AdminMongo", "MongoAdminDevVagrant")
use webappdb # name your db here
# add user to administer your db
db.createUser(
  {
    user: "webapp",
    pwd: "webapppassword",
    roles: [ { role: "readWrite", db: "webappdb" } ]
  }
)
```

At this point, check out [mongoose](https://mongoosejs.com/) and [express](https://expressjs.com/) to build something awesome.
