FROM ubuntu:bionic

ENV VER=4.20.0

RUN apt update \
        && apt install wget \
        && mkdir /v2raybin \ 
        && cd v2raybin \
        && wget --no-check-certificate -O v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
	&& unzip v2ray.zip \
	&& chmod 755 v2ctl \
	&& chmod 755 v2ray \
        && chmod +x /v2raybin/v2ray \
 	&& chgrp -R 0 /v2raybin \
 	&& chmod -R g+rwX /v2raybin 
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
