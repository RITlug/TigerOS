#!/bin/bash
set -eu

#####################################################################
# TigerOS Build Script for running on the build box with Jenkins CI #
# @author: Aidan Kahrs                                              #
#                                                                   #
# Usage: sudo bash ci-build-mock.sh                                 #
#                                                                   #
#####################################################################
# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi
wget -O tigeros.ks https://raw.githubusercontent.com/RITlug/TigerOS/master/tigeros.ks
mock -r fedora-25-x86_64 --init
mock -r fedora-25-x86_64 --copyin tigeros.ks ./tigeros.ks
mock -r fedora-25-x86_64 --install lorax-lmc-novirt git vim-minimal pykickstart
mock -r fedora-25-x86_64 --chroot "livemedia-creator --ks tigeros.ks --no-virt --resultdir /var/lmc --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 25 --title TigerOS-live --macboot"
rm -rf /srv/isos/TigerOS-$(date +%Y%m%d).iso
mock -r fedora-25-x86_64 --copyout /var/lmc/TigerOS.iso /srv/isos/TigerOS-$(date +%Y%m%d).iso 
rm -rf /var/lib/mock/
cd /srv/isos
rm -rf CHECKSUM512-$(date +%Y%m%d)
sha512sum TigerOS-$(date +%Y%m%d).iso > CHECKSUM512-$(date +%Y%m%d) 
chown -R nginx:nginx /srv
chmod 755 /srv/isos/*.iso
echo "Build finished"

