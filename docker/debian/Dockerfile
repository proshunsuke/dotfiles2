FROM ubuntu

MAINTAINER proshunsuke

RUN set -x && apt-get update -qq && apt-get install -y -qq \
libcurl4-gnutls-dev \
libexpat1-dev \
gettext \
libz-dev \
libssl-dev \
make \
git-all \
curl \
locales \
&& sed -i 's/^# ja_JP.UTF-8 UTF-8$/ja_JP.UTF-8 UTF-8/g' /etc/locale.gen \
&& locale-gen ja_JP.UTF-8 \
&& update-locale LANG=ja_JP.UTF-8 \
&& mkdir -p /root/Documents

ENV LANG=ja_JP.UTF-8 \
TZ=Asia/Tokyo

WORKDIR /root/Documents
