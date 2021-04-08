FROM ubuntu:latest

RUN apt update \
        && apt install unzip wget -y \
        && mkdir /v2raybin \ 
        && cd v2raybin \
        && wget --no-check-certificate -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
	&& unzip v2ray.zip \
	&& rm -rf v2ray.zip \
	&& chmod 755 v2ctl \
	&& chmod 755 v2ray \
        && chmod +x /v2raybin/v2ray \
 	&& chgrp -R 0 /v2raybin \
 	&& chmod -R g+rwX /v2raybin \
	&& mkdir /argobin \
	&& cd /argobin \
	&& chgrp -P 0 /argobin \
	&& chmod -R g+rwX /argobin \
	&& mkdir /caddybin \
	&& cd /caddybin \
	&& wget --no-check-certificate -O caddy.tar.gz https://github.com/caddyserver/caddy/releases/download/v2.3.0/caddy_2.3.0_linux_amd64.tar.gz \
	&& wget --no-check-certificate -O index.html https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html \
	&& tar -xf caddy.tar.gz \
	&& rm -rf caddy.tar.gz \
	&& chmod 755 caddy \
	&& chmod +x /caddybin/caddy \
	&& chgrp -R 0 /caddybin \
	&& chmod -R g+rwX /caddybin \
	&& apt clean
	
	
 
ADD entrypoint.sh /entrypoint.sh

COPY config.json /v2raybin/config.json

COPY config.yml /argobin/config.yml

COPY caddyfile /caddybin/caddyfile

RUN chmod +x /entrypoint.sh 

CMD  /entrypoint.sh 

