FROM docker.elastic.co/elasticsearch/elasticsearch:8.13.2
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="elasticsearch" veriosn="8.13.2" author="wintech-nano"

ENV TZ=Asia/Shanghai
ENV ELASTICSEARCH_VERSION 8.13.2
USER root
ADD add_plugins.sh /tmp/add_plugins.sh
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget -O /tmp/analysis-smartcn.zip "https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-smartcn/analysis-smartcn-${ELASTICSEARCH_VERSION}.zip" \
    && chmod +x /tmp/add_plugins.sh \
    && sed -i '/^exec/i sh /tmp/add_plugins.sh' /usr/local/bin/docker-entrypoint.sh

USER elasticsearch
