#!/bin/bash

# File: build.sh
# Description: Build TigerOS RPM Packages
# Author: Tim Zabel <tjz8659@rit.edu>

# Steps:
# 1. check if local or remote build
#    --- If remote, clone repo from $1 arg
# 2. tar *-1.0 directory
# 3. fedpkg --release $2 local
# 4. mv .rpm out of noarch/
# 5. tar rpm and src.rpm together into $1.tar.gz

# Otherwise, display usage message
#    Usage: $0 [--local] [--remote] <package-name> <fedora release>
#    Example: ./build.sh --local tigeros-scripts 29

#TODO: 
# 1. check local / remote flags
# 2. add red failure variable
# 3. create remote scenario


# Variables
green=`tput setaf 2`
reset=`tput sgr0`
package=$1
release=$2
version=29
tarfile="$package-1.0-$release.fc$version.tar.gz"

usage() {
    echo; echo "This script creates an srpm and rpm out of the given package."
    echo "Usage: $@$0 <package-name> <release> " ; echo
}

main() {
    if [ "$#" != 2 ] ; then
        usage
        exit 1
    fi

    # Good to go
    echo ; echo "Compressing $1-1.0 directory..." ; echo
    tar zcvf $tarfile $package-1.0

    # RPM Building
    echo ; echo "Creating RPM Package..." ; echo
    fedpkg --release f$version local

    if [ "$?" != 0 ] ; then
        echo "RPM Building failed!"
        exit 1
    fi

    # Tar RPM
    mv noarch/* $PWD && rm -rf noarch
    tar zcvf $package-repos.tar.gz *.rpm
    rm $tarfile *.rpm .build*

    # Show results
    if [ "$?" == 0 ] ; then
        echo ; echo "$(green)Complete!$(reset)" ; echo
    fi

    exit 0
}

main $@
