FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="nginx_vts_exporter" veriosn="1.7.0" author="wintech-nano"

ENV TZ=Asia/Shanghai
USER root
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/*

ENV NGINX_VTS_EXPORTER_VERSION=0.10.8

COPY start.sh /start.sh
ENV NGINX_STATUS="http://localhost/status/format/json"
RUN set -eux; \
    mkdir -p /opt/nginx_vts_exporter \
    && wget -O /tmp/nginx-vtx-exporter_${NGINX_VTS_EXPORTER_VERSION}_linux_amd64.tar.gz "https://github.com/sysulq/nginx-vts-exporter/releases/download/v${NGINX_VTS_EXPORTER_VERSION}/nginx-vtx-exporter_${NGINX_VTS_EXPORTER_VERSION}_linux_amd64.tar.gz" --no-check-certificate \
    && tar -zxvf /tmp/nginx-vtx-exporter_${NGINX_VTS_EXPORTER_VERSION}_linux_amd64.tar.gz -C /opt/nginx_vts_exporter \
    && rm -rf /tmp/nginx-vtx-exporter_${NGINX_VTS_EXPORTER_VERSION}_linux_amd64.tar.gz \
    && chmod +x /start.sh

ENTRYPOINT ["sh","/start.sh"]
EXPOSE 9913
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]
