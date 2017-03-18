#!/bin/sh
# Enable RPMFusion nonfree repos
# author: Aidan Kahrs <axk4545@rit.edu>
su -c 'dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
