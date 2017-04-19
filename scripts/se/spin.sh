#!/bin/bash
# Spin install script for TigerOS
# author: Aidan Kahrs <axk4545@rit.edu>

# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi
wget http://spinroot.com/spin/Src/spin646.tar.gz -O /tmp/spin.tar.gz
tar -xvf /tmp/spin.tar.gz
cd /tmp/Spin/Src*
dnf install -y byacc
make
install -p -m 755 spin /usr/local/bin/spin
sed -i 's#BIN=/usr/bin#BIN=/usr/local/bin#g' /tmp/Spin/iSpin/install.sh
dnf install tcl tk
bash /tmp/Spin/iSpin/install.sh
dnf remove byacc
