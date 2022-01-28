FROM ubuntu:20.04 as builder

MAINTAINER 1582421598

COPY ./tengine-2.3.3 /app/download/tengine-2.3.3

COPY ./nginx-upload-module-master /app/download/tengine-2.3.3/modules/nginx-upload-module-master

COPY ./ngx_cache_purge-2.3 /app/download/tengine-2.3.3/modules/ngx_cache_purge-2.3

COPY ./ngx-fancyindex-0.5.2 /app/download/tengine-2.3.3/modules/ngx-fancyindex-0.5.2

RUN apt-get update && apt-get -y install build-essential automake openssl libssl-dev libpcre3 libpcre3-dev zlib1g-dev libjemalloc-dev && cd /app/download/tengine-2.3.3 && ./configure --prefix=/app/docker/my-tengine --with-http_ssl_module --with-http_gzip_static_module --with-http_gunzip_module --with-sha1-asm --with-md5-asm --with-http_auth_request_module --with-http_addition_module --with-http_dav_module --with-http_realip_module --with-http_v2_module --with-http_stub_status_module --with-http_sub_module --with-http_flv_module --with-http_mp4_module --with-http_degradation_module --with-http_random_index_module --with-http_secure_link_module --with-ipv6 --with-file-aio --with-mail --with-mail_ssl_module --with-pcre --with-pcre-jit --with-jemalloc --with-stream --with-stream=dynamic --with-stream_ssl_module --with-stream_realip_module --add-module=modules/nginx-upload-module-master --add-module=modules/ngx_cache_purge-2.3 --add-module=modules/ngx-fancyindex-0.5.2 --add-module=modules/ngx_backtrace_module --add-module=modules/ngx_http_concat_module --add-module=modules/ngx_http_proxy_connect_module --add-module=modules/ngx_http_reqstat_module --add-module=modules/ngx_http_slice_module --add-module=modules/ngx_http_sysguard_module --add-module=modules/ngx_http_trim_filter_module --add-module=modules/ngx_http_upstream_check_module --add-module=modules/ngx_http_upstream_consistent_hash_module --add-module=modules/ngx_http_upstream_dynamic_module --add-module=modules/ngx_http_upstream_session_sticky_module --add-module=modules/ngx_http_upstream_vnswrr_module --add-module=modules/ngx_multi_upstream_module --add-module=modules/ngx_slab_stat && make && make install && ln -sf /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime

ENV LANG=en_US.UTF-8

WORKDIR /app/docker/my-tengine

EXPOSE 80 443

CMD /app/docker/my-tengine/sbin/nginx -g "daemon off;"