#!/bin/bash
set -eu

####################################################################
# TigerOS Build Script    		                                   #
# @author: Aidan Kahrs	                                           #
#                                                                  #
# Usage: sudo bash make-iso.sh									   #
#                                                                  #
####################################################################
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Welcome to the TigerOS build script${reset}"
mock -r fedora-25-x86_64 --init
mock -r fedora-25-x86_64 --copyin tigeros.ks ./tigeros.ks
mock -r fedora-25-x86_64 --install lorax-lmc-novirt git vim-minimal pykickstart svn
mock -r fedora-25-x86_64 --chroot "svn export https://github.com/RITlug/TigerOS/trunk/scripts/"
echo "${green}Beginning build process${reset}"
mock -r fedora-25-x86_64 --chroot "livemedia-creator --ks tigeros.ks --no-virt --resultdir /var/lmc --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 25 --title TigerOS-live --macboot"
mock -r fedora-25-x86_64 --copyout /var/lmc/TigerOS.iso TigerOS.iso
echo "${green}ISO saved to $(pwd)/TigerOS.iso${reset}"
