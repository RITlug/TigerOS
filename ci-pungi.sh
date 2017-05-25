#!/bin/bash
set -eu

#################################################################################
# TigerOS Build Script(source iso) for running on the build box with Jenkins CI #
# @author: Aidan Kahrs                                                          #
#                                                                               #
# Usage: sudo bash ci-build-mock.sh                                             #
#                                                                               #
#################################################################################
# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi
wget -O tigeros-source.ks https://raw.githubusercontent.com/RITlug/TigerOS/master/tigeros-source.ks
mock -r fedora-25-x86_64 --init
mock -r fedora-25-x86_64 --copyin tigeros-source.ks ./tigeros-source.ks
mock -r fedora-25-x86_64 --install pungi
mock -r fedora-25-x86_64 --chroot "pungi -G -c tigeros-source.ks --name=TigerOS --ver 25 --force && pungi -C -c tigeros-source.ks --name=TigerOS --ver=25 --force && pungi -I -c tigeros-source.ks --name=TigerOS --ver=25 --sourceisos --force"
rm -rf /srv/isos/TigerOS-source-$(date +%Y%m%d).iso
mock -r fedora-25-x86_64 --copyout /25/source/iso/TigerOS-DVD-source-25.iso /srv/isos/TigerOS-source-$(date +%Y%m%d).iso 
rm -rf /var/lib/mock/
cd /srv/isos
rm -rf CHECKSUM512-source-$(date +%Y%m%d)
sha512sum TigerOS-source-$(date +%Y%m%d).iso > CHECKSUM512-source-$(date +%Y%m%d) 
chown -R nginx:nginx /srv
chmod 755 /srv/isos/*.iso
echo "Pungi finished"

