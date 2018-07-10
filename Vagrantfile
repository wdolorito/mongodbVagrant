Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "mongodb-36-vbox"
  config.vm.network "private_network", ip: "192.168.10.200"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.name = "xenial_mongodb-36"
  end
  config.vm.provision "file", source: "scripts/mongod.conf", destination: "/tmp/mongod.conf"
  config.vm.provision "file", source: "scripts/add_mongo_admin.js", destination: "/tmp/add_mongo_admin.js"
  config.vm.provision "file", source: "scripts/update.sh", destination: "/tmp/update.sh"
  config.vm.provision "shell", path: "scripts/install_mongodb-3.6.sh"
end
