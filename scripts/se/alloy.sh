#!/bin/sh -e

# JFLAP installer script for TigerOS
# author: Josh Bicking <jhb2345@rit.edu>

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
