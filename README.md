# Simple Vagrantfile for mongodb community edition 3.6

Created and tested on macOS High Sierra v10.13.5 (as of 10 July, 2018)

### Required software

- [Virtualbox](https://www.virtualbox.org/) (v5.2.12r122591 tested)
- [Vagrant](https://www.vagrantup.com/) (v2.1.2 tested)

### Files in 'scripts' dir:
- add_mongo_admin.js
- install_mongodb-3.6.sh
- mongod.conf
- update.sh

### How to customize
The admin user and password can be changed in add_mongo_admin.js.  Inside the main Vagrantfile, the private ip address can be changed as well as the hostname of the VM and the name that appears in VirtualBox Manager. `Important: if the private ip is changed, be sure to add the requisite change to mongod.conf bindIp.` mongodb is bound by default to localhost and the static ip 192.168.10.200.
