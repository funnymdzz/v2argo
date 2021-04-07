FROM ubuntu:latest

ENV VER=4.20.0

RUN apt update \
        && apt install unzip wget -y \
        && mkdir /v2raybin \ 
        && cd v2raybin \
        && wget --no-check-certificate -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
	&& unzip v2ray.zip \
	&& chmod 755 v2ctl \
	&& chmod 755 v2ray \
        && chmod +x /v2raybin/v2ray \
 	&& chgrp -R 0 /v2raybin \
 	&& chmod -R g+rwX /v2raybin \
	&& mkdir /argobin \
	&& cd /argobin \
	&& wget --no-check-certificate -O argo https://github.com/cloudflare/cloudflared/releases/download/2021.3.6/cloudflared-linux-amd64 \
	&& chmod 755 argo \
	&& chgrp -P 0 /argobin \
	&& chmod -R g+rwX /argobin
 
ADD entrypoint.sh /entrypoint.sh

COPY config.txt /v2raybin/config.json

COPY config.yml /argobin/config.yml

RUN chmod +x /entrypoint.sh 

CMD  /entrypoint.sh 

