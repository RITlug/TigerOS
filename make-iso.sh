#!/bin/bash
set -eu

####################################################################
# TigerOS Build Script 	                                           #
# @author: Aidan Kahrs	                                           #
#                                                                  #
# Usage: sudo bash make-iso.sh                                     #
#                                                                  #
####################################################################
green=`tput setaf 2`
reset=`tput sgr0`
#to use mock comment out lines 25, 26 and 30 and uncomment all lines beginning with mock
echo "${green}Welcome to the TigerOS build script${reset}"
# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi
mock -r fedora-25-x86_64 --init
mock -r fedora-25-x86_64 --copyin tigeros.ks ./tigeros.ks
mock -r fedora-25-x86_64 --install lorax-lmc-novirt git vim-minimal pykickstart
echo "${green}Beginning build process${reset}"
#setenforce 0
#livemedia-creator --ks tigeros.ks --no-virt --resultdir /var/lmc --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 25 --title TigerOS-live --macboot
mock -r fedora-25-x86_64 --chroot "livemedia-creator --ks tigeros.ks --no-virt --resultdir /var/lmc --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 25 --title TigerOS-live --macboot"
mock -r fedora-25-x86_64 --copyout /var/lmc/TigerOS.iso TigerOS.iso
echo "${green}ISO saved to $(pwd)/TigerOS.iso${reset}"
#setenforce 1
