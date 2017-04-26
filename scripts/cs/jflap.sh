#!/usr/bin/bash

# JFLAP installer script for TigerOS
# author: Josh Bicking <jhb2345@rit.edu>

DEPS=java-1.8.0-openjdk
PROG=JFLAP
FILE=/usr/share/java/JFLAP.jar
FILE_URL=http://www.jflap.org/jflaptmp/may15-2011/withoutSource/JFLAP.jar
LINK=/usr/local/bin/jflap
ICON_URL=http://jflap.org/jflapLogo2.jpg


# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi

## Removal
# Check if remove flag was passed
if [ ! -z "$1" ] && [ "$1" = "--remove" ]
  then

    rm $LINK
    rm /usr/local/share/applications/$PROG.desktop
    rm $FILE
    rm /usr/local/share/icons/$PROG.jpg

else 

    ## Installation
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
    curl -o /usr/local/share/icons/$PROG.jpg $ICON_URL
fi
