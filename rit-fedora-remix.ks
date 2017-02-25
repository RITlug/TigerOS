# The RIT Fedora Remix
#
# Authors:
#   Luke Macken <lmacken@redhat.com>
#   Eitan Romanoff <ear7631@gmail.com>
#   Aidan Kahrs <axk4545@rit.edu>
#
# Tasks:
#
#
# Instructions:
#   sudo yum -y install spin-kickstarts livecd-tools
#   sudo livecd-creator -c fedora-rit-spin.ks

%include /usr/share/spin-kickstarts/fedora-live-desktop.ks
%include /usr/share/spin-kickstarts/fedora-live-minimization.ks

%packages
# Must-have applications



# Legacy cmdline things we don't want


# Drop some system-config things
-system-config-boot
-system-config-language
-system-config-network
-system-config-rootpassword
-system-config-services
-policycoreutils-gui

%end

%post

# go to the backgrounds folder for custom images
cd /usr/share/backgrounds/images

# fetch custom RIT backgrounds


# Fetch rpm fusion scripts, bash_profile
su -c "mkdir -p /usr/share/autostart"

su -c "mv FusionEnableLauncher.txt FusionEnableLauncher.py"
su -c "mv enablerpmfusion.txt enablerpmfusion.sh"
su -c "chmod a+rwx FusionEnableLauncher.py"
su -c "chmod a+rwx enablerpmfusion.sh"

su -c "cp FusionEnableLauncher.py /usr/share/autostart/FusionEnableLauncher.py"
su -c "cp enablerpmfusion.sh /usr/share/autostart/enablerpmfusion.sh"

%end
