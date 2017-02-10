#!/bin/sh

# go to the backgrounds folder for custom images
cd /usr/share/backgrounds/images


# fetch custom RIT backgrounds
# note: resolv.conf is not yet set up, so we have to use the hosting ip directly
su -c "wget --header=\"Host: www.cs.rit.edu\" http://129.21.30.99/~ear7631/RIT_1280x1024.png"
su -c "wget --header=\"Host: www.cs.rit.edu\" http://129.21.30.99/~ear7631/RIT_2048x1536.png"
su -c "wget --header=\"Host: www.cs.rit.edu\" http://129.21.30.99/~ear7631/RIT_1920x1200.png"


# normalish (1280 x 1024)
su -c "cp /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png.backup"
su -c "rm /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png"
su -c "cp /usr/share/backgrounds/images/RIT_1280x1024.png /usr/share/backgrounds/lovelock/default-stripes/normalish/lovelock.png"

# standard (2048x1536)
su -c "cp /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png.backup"
su -c "rm /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png"
su -c "cp /usr/share/backgrounds/images/RIT_2048x1536.png /usr/share/backgrounds/lovelock/default-stripes/standard/lovelock.png"

# wide (1920x1200)
su -c "cp /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png.backup"
su -c "rm /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png"
su -c "cp /usr/share/backgrounds/images/RIT_1920x1200.png /usr/share/backgrounds/lovelock/default-stripes/wide/lovelock.png"