#!/bin/bash
set -eu

#####################################################################
# TigerOS Build Script for running on the build box with Jenkins CI #
# @author: Aidan Kahrs	                                            #
#                                                                   #
# Usage: sudo bash build.sh					                        #
#                                                                   #
#####################################################################
rm -rf tigeros.ks
wget -O tigeros.ks https://raw.githubusercontent.com/RITlug/TigerOS/master/tigeros.ks
livemedia-creator --ks tigeros.ks --no-virt --resultdir /var/lmc --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 25 --title TigerOS-live --macboot
cp -f /var/lmc/TigerOS.iso /srv/isos/
rm -rf /var/lmc/
cd /srv/isos
sha512sum *.iso > CHECKSUM512
cd /home/build
rm -rf anaconda/ *.log
