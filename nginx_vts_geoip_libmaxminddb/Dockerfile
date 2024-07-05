FROM harbor.wintech-nano.com/library/ubuntu:jammy as builder
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="nginx" veriosn="1.24.0" author="wintech-nano"

RUN set -eux; \
    apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends wget \
    && rm -rf /var/lib/apt/lists/*

ENV NGINX_VERSION 1.24.0
ENV ZLIB_VERSION 1.3.1
ENV VTS_VERSION 0.2.2
ENV GEOIP2_VERSION 3.4
ENV LIBMAXMINDDB_VERSION 1.8.0

COPY nginx-module-vts-$VTS_VERSION.tar.gz /tmp/vts-$VTS_VERSION.tar.gz
COPY ngx_http_geoip2_module-$GEOIP2_VERSION.tar.gz /tmp/geoip2-$GEOIP2_VERSION.tar.gz
COPY libmaxminddb-$LIBMAXMINDDB_VERSION.tar.gz /tmp/libmaxminddb-$LIBMAXMINDDB_VERSION.tar.gz

RUN set -eux; \
    addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 1001 nginx \
    && apt update  \
    && apt install -y wget \
    && apt install -y dpkg-dev libpcre3-dev openssl libssl-dev libgd-dev \
    && mkdir -p /tmp/zlib \
    && wget -O /tmp/zlib-$ZLIB_VERSION.tar.gz "https://www.zlib.net/zlib-$ZLIB_VERSION.tar.gz" --no-check-certificate \
    && tar -zxvf /tmp/zlib-$ZLIB_VERSION.tar.gz -C /tmp/zlib \
    && cd /tmp/zlib/zlib-$ZLIB_VERSION \
    && ./configure \
    && make \
    && make install \
    && mkdir -p /tmp/vts \
    && tar -zxvf /tmp/vts-$VTS_VERSION.tar.gz -C /tmp/vts \
    && mkdir -p /tmp/geoip \
    && tar -zxvf /tmp/geoip2-$GEOIP2_VERSION.tar.gz -C /tmp/geoip \
    && mkdir -p /tmp/libmaxminddb \
    && tar -zxvf /tmp/libmaxminddb-$LIBMAXMINDDB_VERSION.tar.gz -C /tmp/libmaxminddb \
    && cd /tmp/libmaxminddb/libmaxminddb-$LIBMAXMINDDB_VERSION \
    && ./configure \
    && make \
    && make install \
    && echo /usr/local/lib  >> /etc/ld.so.conf.d/local.conf \
    && ldconfig \
    && mkdir -p /tmp/nginx \
    && wget -O /tmp/nginx-$NGINX_VERSION.tar.gz "https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz" --no-check-certificate \
    && tar -zxvf /tmp/nginx-$NGINX_VERSION.tar.gz -C /tmp/nginx \
    && mkdir /etc/nginx \
    && mv /tmp/nginx/nginx-$NGINX_VERSION/* /etc/nginx \
    && cd /etc/nginx \
    && mkdir -p /var/cache/nginx/client_temp \
    && mkdir -p /var/cache/nginx/proxy_temp \
    && mkdir -p /var/cache/nginx/fastcgi_temp \
    && mkdir -p /var/cache/nginx/uwsgi_temp \
    && mkdir -p /var/cache/nginx/scgi_temp \
    && ./configure \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --modules-path=/usr/lib/nginx/modules \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log  \
    --http-log-path=/var/log/nginx/access.log  \
    --pid-path=/var/run/nginx.pid  \
    --lock-path=/var/run/nginx.lock  \
    --http-client-body-temp-path=/var/cache/nginx/client_temp   \
    --http-proxy-temp-path=/var/cache/nginx/proxy_temp   \
    --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp   \
    --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp   \
    --http-scgi-temp-path=/var/cache/nginx/scgi_temp   \
    --user=nginx \
    --group=nginx \
    --with-compat \
    --with-file-aio \
    --with-threads  \
    --with-http_addition_module  \
    --with-http_auth_request_module  \
    --with-http_dav_module  \
    --with-http_flv_module  \
    --with-http_gunzip_module  \
    --with-http_gzip_static_module  \
    --with-http_mp4_module  \
    --with-http_random_index_module  \
    --with-http_realip_module  \
    --with-http_secure_link_module  \
    --with-http_slice_module \
    --with-http_ssl_module \
    --with-http_stub_status_module  \
    --with-http_sub_module  \
    --with-http_v2_module  \
    --with-mail  \
    --with-mail_ssl_module  \
    --with-stream \
    --with-stream_realip_module  \
    --with-stream_ssl_module  \
    --with-stream_ssl_preread_module  \
    --with-http_image_filter_module=dynamic \
    --add-dynamic-module=/tmp/vts/nginx-module-vts-$VTS_VERSION \
    --add-dynamic-module=/tmp/geoip/ngx_http_geoip2_module-$GEOIP2_VERSION \
    --with-cc-opt='-g -O2 -ffile-prefix-map=/data/builder/debuild/nginx-$NGINX_VERSION/debian/debuild-base/nginx-$NGINX_VERSION=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' \
    --with-ld-opt='-Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie' \
    && make \
    && make install \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/nginx/sites-enabled-map

FROM harbor.wintech-nano.com/library/ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="nginx" veriosn="1.24.0" author="wintech-nano"

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget nginx \
    && rm -rf /var/lib/apt/lists/* \
    && addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 1001 nginx

COPY --from=builder /usr/sbin/nginx /usr/sbin/nginx
COPY --from=builder /etc/nginx /etc/nginx
COPY --from=builder /var/log/nginx /var/log/nginx
COPY --from=builder /usr/lib/nginx/modules /usr/lib/nginx/modules
COPY --from=builder /var/run /var/run
COPY --from=builder /var/cache/nginx /var/cache/nginx
COPY --from=builder /etc/nginx/html /etc/nginx/html

VOLUME /var/log/nginx
VOLUME /etc/nginx/html
VOLUME /etc/nginx/sites-enabled
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-enabled/default.enabled
COPY map /etc/nginx/sites-enabled-map/map

EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
