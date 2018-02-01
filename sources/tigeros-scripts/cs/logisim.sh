#!/usr/bin/bash

# logisim installer script for TigerOS
# author: Aidan Kahrs <axk4545@rit.edu>

DEPS=java-1.8.0-openjdk
PROG=Logisim
FILE=/usr/share/java/logisim.jar
FILE_URL=https://sourceforge.net/projects/circuit/files/2.3.x/2.3.1/logisim-2.3.1.jar/download
LINK=/usr/local/bin/logisim
ICON_URL=https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Logisim-icon.svg/48px-Logisim-icon.svg.png


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
Version=2.3.1
Name=$PROG
Comment=A graphical tool for designing and simulating logic circuits.
Path=
Exec=$LINK
Icon=/usr/local/share/icons/$PROG.jpg
Terminal=false
Categories=Education;Languages;Java;
EOF
    
    # Get the icons
    mkdir -p /usr/local/share/icons
    curl -o /usr/local/share/icons/$PROG.png $ICON_URL
fi
