# SETTINGS
# NOTE: RELEASE_VER DOES NOT AFFECT EVERYTHING (such as anaconda installclass)
ARG RELEASE_VER=26
ARG BRANCH=nightly
# END SETTINGS
# SETUP PHASE
FROM fedora:${RELEASE_VER}
ENV RELEASE_VER  ${RELEASE_VER} #Re-import
ENV BRANCH ${BRANCH} #Re-import
LABEL maintainer="tigeros@ritlug.com"
LABEL description="Builder container for TigerOS CI - see wiki"
LABEL repo="https://github.com/RITlug/TigerOS/"
LABEL version="f26-2.1-BETA"
# DEPS PHASE
RUN dnf update -y && \
    dnf install -y \
		kernel \
		kernel-devel \
		kernel-headers \
        git \
		lorax \
		anaconda \
        pungi \
        pykickstart \
        anaconda-tui && \
    dnf install -y \
        https://builder.ritlug.com/packages/x86_64/anaconda-installclass-tigeros-26-1.fc26.x86_64.rpm
# BUILD PHASE
WORKDIR /repo
USER root:root
CMD git clone https://github.com/RITlug/TigerOS.git /repo -b ${BRANCH} && \
    livemedia-creator --ks /repo/kickstarts/tigeros.ks --logfile /app/log --no-virt --resultdir /app/live --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever ${RELEASE_VER} --title TigerOS-live --macboot && \
    pungi -G -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver ${RELEASE_VER} --destdir /app/pungi --force && \
    pungi -C -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver ${RELEASE_VER} --destdir /app/pungi --force && \
    pungi -I -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver ${RELEASE_VER} --destdir /app/pungi --sourceisos --force
