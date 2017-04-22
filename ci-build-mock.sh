#!/bin/bash
set -eu

#####################################################################
# TigerOS Build Script for running on the build box with Jenkins CI #
# @author: Aidan Kahrs	                                            #
#                                                                   #
# Usage: sudo bash ci-build-mock.sh					                #
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
mock -r fedora-25-x86_64 --install lorax-lmc-novirt git vim-minimal pykickstart svn
mock -r fedora-25-x86_64 --chroot "svn export https://github.com/RITlug/TigerOS/trunk/scripts/"
mock -r fedora-25-x86_64 --chroot "livemedia-creator --ks tigeros.ks --no-virt --resultdir /var/lmc --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 25 --title TigerOS-live --macboot"
mock -r fedora-25-x86_64 --copyout /var/lmc/TigerOS.iso /srv/isos/TigerOS.iso
rm -rf /var/lmc/
cd /srv/isos/
sha512sum *.iso >CHECKSUM512
chown -R apache:apache /srv

