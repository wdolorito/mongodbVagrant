#!/bin/sh
export APT_LISTCHANGES_FRONTEND=none
export DEBIAN_FRONTEND=noninteractive
APT=apt-get
${APT} update
 ${APT} dist-upgrade -u -y
${APT} -y autoremove --purge
${APT} autoclean
${APT} clean
