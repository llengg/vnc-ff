FROM debian:wheezy
MAINTAINER gaoal "keepob@163.com"

#ADD sources.list /etc/apt/sources.list
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -y install openssh-server openbox thunar tint2 vnc4server vim screen wget && \
    mkdir -p /var/run/sshd;cd /root && \
    wget -O firefox27.deb http://nchc.dl.sourceforge.net/project/ubuntuzilla/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_27.0.1-0ubuntu1_amd64.deb && \
    dpkg -i firefox27.deb && \
    apt-get install libasound2 libdbus-glib-1-2 flashplugin-nonfree -y && \
    chmod 755 /run.sh && \
    rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV ROOT_PASS=12345t
VOLUME  ["/data"]

EXPOSE 22 5901
CMD ["/run.sh"]
