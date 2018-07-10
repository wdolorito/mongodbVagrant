#!/bin/sh
apt-get update &&
apt-get -y dist-upgrade &&
apt-get -y autoremove --purge &&
apt-get clean &&
apt-get autoclean
