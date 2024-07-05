FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="prometheus" veriosn="2.45.4" author="wintech-nano"

ENV TZ=Asia/Shanghai
ENV PROMETHEUS_VERSION 2.45.4
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/prometheus \
    && wget -O /tmp/prometheus.tar.gz "https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz" --no-check-certificate \
    && tar -zxvf /tmp/prometheus.tar.gz -C /tmp/prometheus \
    && mv /tmp/prometheus/prometheus-${PROMETHEUS_VERSION}.linux-amd64 /opt/prometheus \
    && rm -f /tmp/prometheus.tar.gz \
    && rm -rf /tmp/prometheus

WORKDIR /opt/prometheus
VOLUME /opt/prometheus/config
COPY start.sh /opt/prometheus/start.sh

RUN set -eux; \
   chmod +x /opt/prometheus/start.sh

EXPOSE 9090
CMD ["sh","/opt/prometheus/start.sh"]
