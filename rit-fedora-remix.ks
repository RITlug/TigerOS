# The RIT Fedora Remix
#
# Authors:
#   Luke Macken <lmacken@redhat.com>
#   Eitan Romanoff <ear7631@gmail.com>
#
# Tasks:
#   https://fedorahosted.org/fossrit/query?milestone=RIT+Spin
#
# Instructions:
#   sudo yum -y install spin-kickstarts livecd-tools
#   sudo livecd-creator -c fedora-rit-spin.ks

%include /usr/share/spin-kickstarts/fedora-live-desktop.ks
%include /usr/share/spin-kickstarts/fedora-live-minimization.ks

%packages
# Must-have applications
wget
libreoffice-writer
libreoffice-calc
thunderbird
pidgin
ekiga
emacs
gimp
inkscape
dia
banshee
git
htop
powertop
nethack
screen
vim-common
vim-enhanced
vim
zsh
nano
gpp
wine
wireshark
irssi
hexchat
gwibber
elinks
transmission
midori
evince
fpaste


# Legacy cmdline things we don't want
-krb5-auth-dialog
-krb5-workstation
-pam_krb5
-quota
-minicom
-jwhois
-mtr
-pinfo
-rsh
-nfs-utils
-ypbind
-yp-tools
-rpcbind
-acpid
-ntsysv

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
# note: resolv.conf is not yet set up, so we have to use the hosting ip directly
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/RIT_1280x1024.png"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/RIT_2048x1536.png"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/RIT_1920x1200.png"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/tiger_1280x1024.png"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/tiger_2048x1536.png"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/tiger_1920x1200.png"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/sentinel_1280x800.png"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/celebration_1280x800.png"

# normalish (1280 x 1024)
su -c "cp /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png.backup"
su -c "rm /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png"
su -c "cp /usr/share/backgrounds/images/tiger_1280x1024.png /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png"

# standard (2048x1536)
su -c "cp /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png.backup"
su -c "rm /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png"
su -c "cp /usr/share/backgrounds/images/tiger_2048x1536.png /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png"

# wide (1920x1200)
su -c "cp /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png.backup"
su -c "rm /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png"
su -c "cp /usr/share/backgrounds/images/tiger_1920x1200.png /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png"


# Fetch rpm fusion scripts, bash_profile
su -c "mkdir -p /usr/share/autostart"

su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/enablerpmfusion.txt"
su -c "wget --header=\"Host: foss.rit.edu\" http://129.21.49.21/ritfedoraremix/FusionEnableLauncher.txt"
su -c "mv FusionEnableLauncher.txt FusionEnableLauncher.py"
su -c "mv enablerpmfusion.txt enablerpmfusion.sh"
su -c "chmod a+rwx FusionEnableLauncher.py"
su -c "chmod a+rwx enablerpmfusion.sh"

su -c "cp FusionEnableLauncher.py /usr/share/autostart/FusionEnableLauncher.py"
su -c "cp enablerpmfusion.sh /usr/share/autostart/enablerpmfusion.sh"

%end
