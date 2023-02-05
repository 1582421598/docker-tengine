FROM ubuntu:22.04 as builder

MAINTAINER 1582421598

COPY ./tengine-2.4.0 /app/download/tengine-2.4.0

COPY ./ngx_cache_purge-2.3 /app/download/tengine-2.4.0/modules/ngx_cache_purge-2.3

COPY ./ngx-fancyindex-0.5.2 /app/download/tengine-2.4.0/modules/ngx-fancyindex-0.5.2

RUN apt-get update && apt-get -y install build-essential automake openssl libssl-dev libpcre3 libpcre3-dev zlib1g-dev libjemalloc-dev && cd /app/download/tengine-2.4.0 && ./configure --prefix=/app/docker/my-tengine  --add-module=modules/ngx_cache_purge-2.3 --add-module=modules/ngx-fancyindex-0.5.2 && make && make install && ln -sf /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime

ENV LANG=en_US.UTF-8

WORKDIR /app/docker/my-tengine

EXPOSE 80 443

CMD /app/docker/my-tengine/sbin/nginx -g "daemon off;"