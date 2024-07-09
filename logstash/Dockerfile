FROM logstash/logstash:7.17.22
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="logstash" veriosn="7.17.22" author="wintech-nano"

USER root
ENV TZ=Asia/Shanghai
ENV ELASTICSEARCH_PORT=9200
COPY replace.sh /replace.sh
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i "s,xpack,#xpack,g" /usr/share/logstash/config/logstash.yml \
    && sed -i '/^export/i sh /replace.sh' /usr/local/bin/docker-entrypoint \
    && chmod +x /replace.sh

EXPOSE 5044
USER logstash
