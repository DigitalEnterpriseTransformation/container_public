FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="kafka_exporter" veriosn="1.7.0" author="wintech-nano"

ENV KAFKA_EXPORTER_VERSION=1.7.0
ENV KAFKA_PORT=9092
ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN set -eux; \
    mkdir -p /tmp/kafka_exporter \
    && wget -O /tmp/kafka_exporter-$KAFKA_EXPORTER_VERSION.linux-amd64.tar.gz "https://github.com/danielqsj/kafka_exporter/releases/download/v$KAFKA_EXPORTER_VERSION/kafka_exporter-$KAFKA_EXPORTER_VERSION.linux-amd64.tar.gz" --no-check-certificate \
    && tar -zxvf /tmp/kafka_exporter-$KAFKA_EXPORTER_VERSION.linux-amd64.tar.gz -C /tmp/kafka_exporter \
    && mv /tmp/kafka_exporter/kafka_exporter-$KAFKA_EXPORTER_VERSION.linux-amd64 /opt/kafka_exporter \
    && rm -rf /tmp/kafka_exporter-$KAFKA_EXPORTER_VERSION.linux-amd64.tar.gz \
    && rm -rf /tmp/kafka_exporter \
    && chmod +x /start.sh

ENTRYPOINT ["sh","/start.sh"]
EXPOSE 9308
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]
