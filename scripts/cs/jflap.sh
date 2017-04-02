#!/bin/sh -e

## JFLAP v7

DEPS=java-1.8.0-openjdk
PROG=JFLAP
DIR=/usr/share/java/JFLAP
FILE=JFLAP.jar
FILE_URL=http://www.jflap.org/jflaptmp/may15-2011/withoutSource/JFLAP.jar
LINK=/usr/local/bin/jflap
ICON_URL=http://jflap.org/jflapLogo2.jpg


# Check that the current user is root
if [ $EUID != 0 ]
then
    echo "Please run this script as root (sudo $@$0)."
    exit
fi


# Install dependencies

dnf install $DEPS -y


# Make the dirs

mkdir -p $DIR


# Get the files

curl -o $DIR/$FILE $FILE_URL


# Make a link

cat > $LINK <<EOF
#!/bin/sh
cd \$HOME
java -jar $DIR/$FILE
EOF

chmod +x $LINK
chmod +x $DIR/$FILE


# Make a desktop file

cat > /usr/local/share/applications/$PROG.desktop <<EOF
[Desktop Entry]

# The type as listed above
Type=Application

# The version of the desktop entry specification to which this file complies
Version=7.0

# The name of the application
Name=$PROG

# A comment which can/will be used as a tooltip
Comment=Experiment with formal languages topics

# The path to the folder in which the executable is run
Path=

# The executable of the application, possibly with arguments.
Exec=$LINK

# The name of the icon that will be used to display this entry
Icon=/usr/local/share/icons/$PROG.jpg

# Describes whether this application needs to be run in a terminal or not
Terminal=false

# Describes the categories in which this entry should be shown
Categories=Education;Languages;Java;
EOF


# Get the icons

mkdir -p /usr/local/share/icons
curl -o /usr/local/share/icons/$PROG.jpg $ICON_URL
