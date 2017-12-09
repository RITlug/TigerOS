FROM fedora:26
LABEL maintainer="tigeros@ritlug.com"
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
        https://builder.ritlug.com/packages/x86_64/anaconda-installclass-tigeros-26-1.fc26.x86_64.rpm && \
    git clone https://github.com/RITlug/TigerOS.git /repo -b nightly
WORKDIR /repo
USER root:root
CMD git pull && \
    livemedia-creator --ks /repo/kickstarts/tigeros.ks --logfile /app/log --no-virt --resultdir /app/live --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 26 --title TigerOS-live --macboot && \
    pungi -G -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver 26 --destdir /app/pungi --force && \
    pungi -C -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver 26 --destdir /app/pungi --force && \
    pungi -I -c /repo/kickstarts/tigeros-source.ks --family=TigerOS --ver 26 --destdir /app/pungi --sourceisos --force
