#!/usr/bin/bash

# MIT Alloy installer script for TigerOS
# author: Aidan Kahrs <axk4545@rit.edu>

DEPS=java-1.8.0-openjdk
PROG=Alloy
FILE=/usr/share/java/alloy.jar
FILE_URL=http://alloy.mit.edu/alloy/downloads/alloy4.2.jar
LINK=/usr/local/bin/alloy


# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi
# Check if remove flag was passed
if [ ! -z "$1" ] && [ "$1" = "--remove" ]
  then

    rm $LINK
    rm /usr/local/share/applications/$PROG.desktop
    rm $FILE
    rm /usr/local/share/icons/$PROG.jpg

else 

# Install dependencies
dnf install $DEPS -y

# Get the files
curl -o $FILE $FILE_URL

# Make a link
cat > $LINK <<EOF
#!/bin/sh
cd \$HOME
java -jar $FILE
EOF

chmod +x $LINK
chmod +x $FILE


# Make a desktop file
cat > /usr/local/share/applications/$PROG.desktop <<EOF
[Desktop Entry]
Type=Application
Version=7.0
Name=$PROG
Comment=Experiment with formal languages topics
Path=
Exec=$LINK
Icon=/usr/local/share/icons/$PROG.jpg
Terminal=false
Categories=Education;Languages;Java;
EOF

# Get the icons
mkdir -p /usr/local/share/icons
unzip -j "$FILE" "images/logo.gif" -d "alloy.gif"
