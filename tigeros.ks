# The RIT Fedora Remix
#
# Authors:
#   Aidan Kahrs <axk4545@rit.edu>
#
# Tasks:
#
#
# Instructions:
#   sudo yum -y install spin-kickstarts livecd-tools
#   sudo livecd-creator -c tigeros.ks

%include /usr/share/spin-kickstarts/fedora-live-desktop.ks
%include /usr/share/spin-kickstarts/fedora-live-minimization.ks

%packages
# Must-have applications

#fix branding
-fedora-logos
-fedora-release
-fedora-release-notes
generic-logos
generic-release
generic-release-notes
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
