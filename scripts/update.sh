#!/bin/sh
APT=apt-get
${APT} update
${APT} -y dist-upgrade
${APT} -y autoremove --purge
${APT} autoclean
${APT} clean
