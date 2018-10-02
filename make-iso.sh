#!/bin/bash
set -eu

####################################################################
# TigerOS Build Script                                             #
# @author: Aidan Kahrs                                             #
#                                                                  #
# Usage: sudo bash make-iso.sh                                     #
#                                                                  #
####################################################################
green=`tput setaf 2`
reset=`tput sgr0`
vers=29
result_dir=/var/lmc/TigerOS

#to use mock comment out lines 25, $vers and 30 and uncomment all lines beginning with mock
echo "${green}Welcome to the TigerOS build script${reset}"
# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi
# /var/lmc/TigerOS cannot exist before building
if [ -d $result_dir ]
then
    rm -rf $result_dir
fi
dnf install -y lorax-lmc-novirt git vim-minimal pykickstart
dnf install -y https://mirrors.ritlug.com/TigerOS/$vers/packages/x86_64/anaconda-installclass-tigeros-$vers-1.fc$vers.x86_64.rpm
echo "${green}Beginning build process${reset}"
setenforce 0
livemedia-creator --ks kickstarts/tigeros.ks --no-virt --resultdir $result_dir --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever $vers --title TigerOS-live --macboot
echo "${green}ISO saved to $result_dir/TigerOS.iso${reset}"
setenforce 1
