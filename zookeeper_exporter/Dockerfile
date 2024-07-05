FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="zookeeper_exporter" veriosn="1.7.0" author="wintech-nano"

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/*

ENV ZOOKEEPER_EXPORTER_VERSION 1.1.0
ENV ZOOKEEPER_PORT 2181

COPY start.sh /start.sh
RUN set -eux; \
    mkdir -p /opt/zookeeper_exporter \
    && wget -O /opt/zookeeper_exporter/zookeeper_exporter "https://github.com/carlpett/zookeeper_exporter/releases/download/v$ZOOKEEPER_EXPORTER_VERSION/zookeeper_exporter" --no-check-certificate \
    && chmod +x /opt/zookeeper_exporter/zookeeper_exporter \
    && chmod +x /start.sh

ENTRYPOINT ["sh","/start.sh"]
EXPOSE 9143
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]
