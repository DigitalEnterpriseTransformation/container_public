FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="filebeat" veriosn="8.x" author="wintech-nano"

COPY start.sh /start.sh
COPY add_key.sh /add_key.sh

ENV TZ=Asia/Shanghai
ENV ELASTICSEARCH_VERSION 8.x
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget apt-transport-https gnupg ca-certificates \
    && chmod +x /add_key.sh \
    && sh /add_key.sh \
    && echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/${ELASTICSEARCH_VERSION}/apt stable main" | tee /etc/apt/sources.list.d/elastic-${ELASTICSEARCH_VERSION}.list \
    && apt update  \
    && apt install filebeat \
    && rm -rf /var/lib/apt/lists/* \
    && chmod a+x /start.sh

ENTRYPOINT ["sh","/start.sh"]
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]
