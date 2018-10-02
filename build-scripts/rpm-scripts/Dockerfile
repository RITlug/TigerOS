###################################
# TigerOS RPM Building Dockerfile #
###################################
FROM fedora:29

LABEL maintainer="TigerOS <tigeros@ritlug.com>"

WORKDIR /build
RUN dnf -y install git fedora-packager fedora-review

CMD bash -c "./build.sh; if [ $USR ]; then adduser $USR; chown -R $USR:$USR .; fi"
