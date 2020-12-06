FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
    && apt-get -y install \
        build-essential wget libssl-dev libncurses5-dev \
        libnewt-dev libsqlite3-dev uuid-dev libedit-dev \
        libjansson-dev libxml2-dev

RUN mkdir res
COPY /res/asterisk.tgz /res
WORKDIR /res
RUN tar -zxvf asterisk.tgz
WORKDIR /res/asterisk-certified-16.8-cert3
RUN ./configure 
RUN make install
RUN make samples

RUN rm -r /res

RUN useradd -d /var/lib/asterisk asterisk

EXPOSE 5060/udp 5060/tcp
VOLUME /var/lib/asterisk/sounds /var/lib/asterisk/keys /var/lib/asterisk/phoneprov /var/spool/asterisk /var/log/asterisk
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]