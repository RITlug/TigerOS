#!/bin/sh -e

# IntelliJ installer script for TigerOS
# author: Josh Bicking <jhb2345@rit.edu>

DEPS=java-1.8.0-openjdk
PROG="IntelliJ IDEA Community Edition"
PROG_SHORT=idea-ce
VERSION=idea-IC-171.4073.35
TEMP_FILE=/tmp/ideaIC-2017.1.1.tar.gz
FILE=/usr/local/$VERSION/bin/idea.sh
FILE_DIR=/usr/local/bin/$VERSION/
FILE_URL=https://download.jetbrains.com/idea/ideaIC-2017.1.1.tar.gz
LINK=/usr/local/bin/idea-ce
ICON=/usr/local/$VERSION/bin/idea.png


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
    rm /usr/local/share/applications/jetbrains-idea-ce.desktop
    rm -rf $FILE_DIR

    # Remove local links if they were created
    for i in `ls /home/`
    do 
        rm -f /home/$i/.local/share/applications/jetbrains-idea-ce.desktop
    done

else 

    ## Installation
    # Install dependencies
    dnf install $DEPS -y

    # Get the files
    wget -O $TEMP_FILE $FILE_URL 
    # Extract the files
    tar -xf $TEMP_FILE -C /usr/share/java/

    # Make a link
    ln -s $FILE $LINK

    chmod +x $LINK
    chmod -R 755 $FILE_DIR

    # Make a desktop file
    # IDEA's first time setup allows the user to make this file. Naming it as such means the user won't get a duplicate entry.
    cat > /usr/local/share/applications/jetbrains-idea-ce.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=$PROG
Comment=The Drive to Develop
Exec=$LINK %f
Icon=$ICON
Terminal=false
Categories=Development;IDE;Java;
StartupWMClass=jetbrains-idea-ce
EOF

    # Clean up
    rm $TEMP_FILE

fi
