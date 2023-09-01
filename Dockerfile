FROM ubuntu:22.04 as builder

MAINTAINER 1582421598

COPY ./tengine-master /app/download/tengine-master

COPY ./ngx_cache_purge-2.3 /app/download/tengine-master/modules/ngx_cache_purge-2.3

COPY ./ngx-fancyindex-master /app/download/tengine-master/modules/ngx-fancyindex-master

RUN apt-get update && apt-get -y install build-essential automake openssl libssl-dev libpcre3 libpcre3-dev zlib1g-dev libjemalloc-dev && cd /app/download/tengine-master && ./configure --prefix=/app/docker/my-tengine  --with-http_ssl_module --with-sha1-asm --with-md5-asm --with-http_auth_request_module --with-http_addition_module --with-http_dav_module --with-http_realip_module --with-http_v2_module  --with-http_sub_module --with-http_flv_module --with-http_mp4_module --with-http_random_index_module --with-http_secure_link_module --with-ipv6 --with-mail --with-mail_ssl_module --with-pcre --with-pcre-jit --with-jemalloc --with-stream --with-stream=dynamic --with-stream_ssl_module --with-stream_realip_module --add-module=modules/ngx_cache_purge-2.3 --add-module=modules/ngx-fancyindex-master --add-module=modules/ngx_http_concat_module --add-module=modules/ngx_http_footer_filter_module --add-module=modules/ngx_http_proxy_connect_module --add-module=modules/ngx_http_reqstat_module --add-module=modules/ngx_http_slice_module --add-module=modules/ngx_http_sysguard_module --add-module=modules/ngx_http_trim_filter_module --add-module=modules/ngx_http_upstream_check_module --add-module=modules/ngx_http_upstream_consistent_hash_module --add-module=modules/ngx_http_upstream_dynamic_module --add-module=modules/ngx_http_upstream_session_sticky_module --add-module=modules/ngx_http_upstream_vnswrr_module --add-module=modules/ngx_http_user_agent_module --add-module=modules/ngx_multi_upstream_module && make && make install && ln -sf /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime

ENV LANG=en_US.UTF-8

WORKDIR /app/docker/my-tengine

EXPOSE 80 443

CMD /app/docker/my-tengine/sbin/nginx -g "daemon off;"