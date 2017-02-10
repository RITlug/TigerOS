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
#libreoffice-base
libreoffice-calc
thunderbird
#codeblocks
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
#mplayer
screen
vim-common
vim-enhanced
vim
zsh
#vlc
nano
#audacity
gpp
wine
wireshark
irssi
xchat
gwibber
elinks
transmission
midori
evince
gnumeric
abiword
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

# This will remove duplicate omni.jar archives created from previous builds
rm -rf /tmp/firefox-omni

#unzip omni.jar
mkdir -p /tmp/firefox-omni
pushd /tmp/firefox-omni
unzip /usr/lib*/firefox-*/omni.jar

# Create the custom browserconfig.properties file
cat > /tmp/firefox-omni/chrome/en-US/locale/branding/browserconfig.properties <<EOF
browser.startup.homepage=http://foss.rit.edu/ritfedoraspin/spinwelcome.html
EOF

# Create the custom bookmarks.html file
cat > /tmp/firefox-omni/defaults/profile/bookmarks.html <<EOF
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<!-- This is an automatically generated file.
     It will be read and overwritten.
     DO NOT EDIT! -->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>

<DL><p>
    <DT><H3 ADD_DATE="961112773" LAST_MODIFIED="1241209009" PERSONAL_TOOLBAR_FOLDER="true">Bookmarks Toolbar</H3>
    <DL><p>
        <DT><A HREF="http://docs.fedoraproject.org/" ADD_DATE="1158286602" LAST_MODIFIED="1176675660" LAST_CHARSET="UTF-8">Fedora Documentation</A>
        <DD>Fedora Documentation.
        <DT><H3 ADD_DATE="1130967903" LAST_MODIFIED="1241211003">Fedora Project</H3>
        <DL><p>
            <DT><A HREF="http://fedoraproject.org/" ADD_DATE="1158286779" LAST_MODIFIED="1176675285" LAST_CHARSET="UTF-8">Fedora Project</A>
            <DD>Home of the Fedora Project.
            <DT><A HREF="http://forums.fedoraforum.org/" ADD_DATE="1130967896" LAST_MODIFIED="1176675301" LAST_CHARSET="ISO-8859-1">Fedora Forum</A>
            <DD>Fedora Forums for community interaction.
            <DT><A HREF="http://fedorasolved.org/" ADD_DATE="1130967896" LAST_MODIFIED="1176675301" LAST_CHARSET="ISO-8859-1">Fedora Solved</A>
            <DD>Community answers to community questions.
            <DT><A HREF="http://fedoraproject.org/wiki/FWN/LatestIssue" ADD_DATE="1176675071" LAST_MODIFIED="1176675310" LAST_CHARSET="ISO-8859-1">Fedora Weekly News</A>
            <DD>Fedora Weekly News.
            <DT><A HREF="http://planet.fedoraproject.org/" ADD_DATE="1176675201" LAST_MODIFIED="1241208858" LAST_CHARSET="UTF-8">Planet Fedora</A>
            <DD>Blogs by Fedora contributors.
            <DT><A HREF="http://fedoraproject.org/en/join-fedora" ADD_DATE="1241209418" LAST_MODIFIED="1241209719">Join Fedora!</A>
            <DD>Join the Fedora Project!
        </DL><p>
      
        <DT><H3 ADD_DATE="1176674113" LAST_MODIFIED="1241208802">Red Hat</H3>
        <DL><p>
            <DT><A HREF="http://www.redhat.com/" ADD_DATE="1176674148" LAST_MODIFIED="1176674158" LAST_CHARSET="ISO-8859-1">Red Hat</A>
            <DD>Home of Red Hat, sponsor of the Fedora Project.
            <DT><A HREF="http://www.jboss.org/" ADD_DATE="1176674189" LAST_MODIFIED="1176674200" LAST_CHARSET="UTF-8">JBoss</A>
            <DD>Home of the JBoss community, sponsored by Red Hat.
            <DT><A HREF="http://opensource.com/" ADD_DATE="1269287471" LAST_MODIFIED="1176674200">OpenSource.com</A>
            <DD>Open Source applied to the world.
            <DT><A HREF="http://theopensourceway.org/" ADD_DATE="1269287471" LAST_MODIFIED="1176674200">The Open Source Way</A>
            <DD>Community authored open source best practices.
        </DL><p>

        <DT><H3 ADD_DATE="1176674388" LAST_MODIFIED="1241209425">Free Content</H3>
        <DL><p>
            <DT><A HREF="http://www.wikipedia.org/" ADD_DATE="1176674401" LAST_MODIFIED="1176675382" LAST_CHARSET="UTF-8">Wikipedia</A>
            <DD>Collaborative encycolpedia.
            <DT><A HREF="http://librivox.org/" ADD_DATE="1241209006" LAST_MODIFIED="1241209033">LibriVox</A>
            <DD>Freely licensed audio books.
            <DT><A HREF="http://www.openclipart.org/" ADD_DATE="1269287471" LAST_MODIFIED="1241209033">Open Clip Art</A>
            <DD>Freely licensed clip art.
            <DT><A HREF="http://www.freesound.org/" ADD_DATE="1269287471" LAST_MODIFIED="1241209033">Free Sound</A>
            <DD>Freely licensed sound.
            <DT><A HREF="http://creativecommons.org/" ADD_DATE="1176674776" LAST_MODIFIED="1176675626" LAST_CHARSET="UTF-8">Creative Commons</A>
            <DD>Free licenses for creative work.
        </DL><p>
        <DT><A FEEDURL="http://foss.rit.edu/files/bookmarks.rss" HREF="http://fss.rit.edu">RIT Bookmarks</A>
        </DL><p>
</DL><p>
EOF

# Zip things back up
# >/dev/null will mute output
zip -9 -r omni.jar * >/dev/null

mv omni.jar /usr/lib/firefox-6/omni.jar


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
