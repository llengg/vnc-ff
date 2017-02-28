FROM debian:wheezy
MAINTAINER gaoal "keepob@163.com"

#ADD sources.list /etc/apt/sources.list
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -y install openssh-server openbox thunar tint2 vnc4server vim screen wget libasound2 libdbus-glib-1-2 && \
    mkdir -p /var/run/sshd;cd /root && \
    wget -O firefox27.deb http://dl.reone.win/files/firefox27.deb && \
    dpkg -i firefox27.deb && \
    chmod 755 /run.sh && \
    rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV ROOT_PASS=12345t
VOLUME  ["/data"]

EXPOSE 22 5901
CMD ["/run.sh"]
