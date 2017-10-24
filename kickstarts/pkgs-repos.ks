repo --name="rpmfusion-free" --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
repo --name="rpmfusion-free-updates" --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch
repo --name="tigeros" --baseurl=https://tigeros.ritlug.com/packages/$basearch/
repo --name="Copr repo for gscreenshot owned by thenaterhood" --baseurl=https://copr-be.cloud.fedoraproject.org/results/thenaterhood/gscreenshot/fedora-$releasever-$basearch/



anaconda-installclass-tigeros
chromium
generic-release-notes
gimp
glibc-all-langpacks
gscreenshot
gstreamer1-plugin-mpg123
hexchat
htop
inkscape
lynx
memtest86+
parole
pidgin
rhythmbox
rpmfusion-free-release
scrot
tigeros-backgrounds
tigeros-ff-profile
tigeros-logos
tigeros-release
tigeros-repos
tigeros-scripts
transmission
vim
wget
yumex-dnf
zsh
-@dial-up
-@input-methods
-gfs2-utils
-reiserfs-utils
-PackageKit*
-autofs
-coolkey
-fedora-bookmarks
-fedora-icon-theme
-fedora-logos
-fedora-release
-fedora-release-notes
-gstreamer1-plugins-ugly
-gnome-screenshot
-hplip
-isdn4k-utils
-mpage
-numactl
-policycoreutils-gui
-sane-backends
-sox
-system-config-boot
-system-config-language
-system-config-network
-system-config-rootpassword
-system-config-services
-xsane
-xsane-gimp

%end
