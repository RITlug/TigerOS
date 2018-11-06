#######################################
# TigerOS Dockerfile for ISO Building #
#######################################
FROM fedora:29

# NOTE: RELEASE_VER DOES NOT AFFECT EVERYTHING (such as anaconda installclass)
ENV RELEASE_VER 29
ENV BRANCH fedora-29
LABEL maintainer="tigeros@ritlug.com" description="Builder container for TigerOS CI - see wiki for usage" repo="https://github.com/RITlug/TigerOS/" version="f29-BETA"

# DEPS PHASE
RUN dnf update -y && \
dnf install -y kernel kernel-devel kernel-headers git lorax anaconda pungi pykickstart wget anaconda-tui dracut-live python3-devel && \
wget -c --no-check-certificate https://mirrors.ritlug.com/TigerOS/${RELEASE_VER}/packages/x86_64/anaconda-installclass-tigeros-${RELEASE_VER}-1.fc${RELEASE_VER}.x86_64.rpm && \
dnf install -y anaconda-installclass-tigeros-${RELEASE_VER}-1.fc${RELEASE_VER}.x86_64.rpm  && \
git clone https://github.com/RITlug/TigerOS.git /repo -b ${BRANCH} --single-branch --depth=1

# BUILD PHASE
WORKDIR /repo
CMD git pull && git checkout ${BRANCH} && \
livemedia-creator --ks /repo/kickstarts/tigeros.ks --nomacboot --logfile /app/log --no-virt --resultdir /app/live \
--project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever ${RELEASE_VER} --title TigerOS-live --macboot && \
pungi -G -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver  --destdir /app/pungi --force && \
pungi -C -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver  --destdir /app/pungi --force && \
pungi -I -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver  --destdir /app/pungi --sourceisos --force
