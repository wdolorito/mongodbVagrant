# Simple Vagrantfile for MongoDB community edition 4.2 and nodejs 12

### Required software

- [Virtualbox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

#### Tested on:
##### Windows 10 1909 (OS Build 18363.778) (cross platforming with MSYS2)
- VirtualBox v6.1.6r137129 **_(installed from website)_**
- Vagrant v2.2.9 **_(installed from website)_**

##### KDE neon 5.18 User Edition (second *(read as primary)* OS on mac mini)
- KDE Plasma v5.18.5
- KDE Frameworks v5.70.0
- Qt v5.14.2
- Kernel v5.3.0-51-generic
- VirtualBox v5.2.34_Ubuntur133883 **_(installed using apt)_**
- Vagrant v2.0.2 **_(installed using apt)_**

##### OS X El Capitan (Version 10.11.6) `someone give me a mac mini server!  >= mid-2011+ pls :-D`
- VirtualBox v6.1.6r137129 **_(installed from website)_**
- Vagrant v2.2.9 **_(installed from website)_**

##### elementary OS 5.1.4 Hera (personal daily driver)
- Kernel v4.15.0-99-generic
- VirtualBox v5.2.34_Ubuntur133883 **_(installed using apt)_**
- Vagrant v2.0.2 **_(installed using apt)_**

### Files in 'scripts' dir:
- add_mongo_admin.js
- install_mongodb-4.0.sh **_(replaced by mongodb-4.2.sh used previously for ubuntu bionic)_**
- install_mongodb-4.2.sh
- install_node-10.x.sh **_(replaced by node-12.x.sh used previously for ubuntu bionic)_**
- install_node-12.x.sh
- mongod.conf
- update.sh

### How to customize
The admin user and password can be changed in add_mongo_admin.js.  Inside the main Vagrantfile, the private ip address can be changed as well as the hostname of the VM and the name that appears in VirtualBox Manager. `Important: if the private ip is changed, be sure to add the requisite change to mongod.conf line bindIp.`

### Bring up everything using VirtualBox

```sh
cd virtualbox
vagrant up
```

The MongoDB server is bound by default to localhost (itself) and the static IP 192.168.10.200.  The default static IP of the nodejs box is 192.168.10.230.

### How to use nodejs box
The mongo shell will have been installed after bringing up the nodejs box.  

```sh
cd virtualbox
vagrant up # if not running already
vagrant ssh nodejs
```

Connect to running mongodb server and authenticate (assuming default values)

```sh
mongo --host 192.168.10.200 --port 27017
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

Finally, you can either copy the ssh keys generated during setup to your default key locations or use them directly.  Add the following to the end of your `~/.ssh/config` file:

```sh
# Vagrant nodejs box
Host vagrant-nodejs
  HostName 192.168.10.230
  user vagrant
  IdentitiesOnly yes
  IdentityFile ~/.ssh/vagrant-nodejs_key

# Vagrant mongodb box
Host vagrant-mongodb
  HostName 192.168.10.200
  user vagrant
  IdentitiesOnly yes
  IdentityFile ~/.ssh/vagrant-mongodb_key
```

The generated private keys are located in their respective directories:  `.../.vagrant/machines/{mongodb,nodejs}/virtualbox/private_key`

Running `vagrant ssh-config` inside the `virtualbox` directory will give you the exact location.  The value used is what follows after `IdentityFile`.  Inside an [MSYS2](https://www.msys2.org/) installation, an example full path to the setup generated key could appear as follows: `/c/testing/mongodbVagrant/virtualbox/.vagrant/machines/mongodb/virtualbox/private_key` or `/c/testing/mongodbVagrant/virtualbox/.vagrant/machines/nodejs/virtualbox/private_key`.  For the above example, the keys were copied and renamed to the private `.ssh` directory.

Now, from the local machine, ssh, scp, et al will be able to authenticate and connect to the boxes:
```sh
ssh vagrant-nodejs  # to connect to nodejs application server
ssh vagrant-mongodb # to connect to mongodb server
```

### At this point, check out [mongoose](https://mongoosejs.com/) and [express](https://expressjs.com/) to build something awesome.

###### Don't like running everything from one file?  *No Problem!*  Separate Vagrantfile's are located in the `virtualbox` directory labeled `Vagrantfile.mongodb` and `Vagrantfile.nodejs`.

#### Links to installation instructions
##### nodejs:
- [https://github.com/nodesource/distributions/blob/master/README.md#debinstall](https://github.com/nodesource/distributions/blob/master/README.md#debinstall)

##### MongoDB Community Edition:
- [https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/)
- [https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/)
