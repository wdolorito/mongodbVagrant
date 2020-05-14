#!/bin/sh
mv /etc/systemd/network/99-vagrant.network /etc/systemd/network/100-vagrant.network
systemctl restart systemd-networkd
