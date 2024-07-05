FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="mysqlrouter" veriosn="8.0.35" author="wintech-nano"

ENV MYSQL_VERSION=8.0.35
ENV RW_DESTINATIONS=127.0.0.1:3306
ENV RO_DESTINATIONS=127.0.0.1:3306

ENV TZ=Asia/Shanghai
VOLUME /var/log/mysqlrouter
WORKDIR /opt/mysqlrouter

COPY start.sh /start.sh
COPY mysqlrouter.conf /tmp/mysqlrouter.conf

RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/mysqlrouter \
    && wget -O /opt/mysqlrouter/mysqlrouter_${MYSQL_VERSION}.deb "https://dev.mysql.com/get/Downloads/MySQL-Router/mysql-router-community_${MYSQL_VERSION}-1ubuntu22.04_amd64.deb" --no-check-certificate \
    && dpkg -i /opt/mysqlrouter/mysqlrouter_${MYSQL_VERSION}.deb \
    && rm -rf /opt/mysqlrouter/mysqlrouter_${MYSQL_VERSION}.deb \
    && chmod +x /start.sh

EXPOSE 7001 7002
ENTRYPOINT ["sh","/start.sh"]
CMD ["/bin/bash"]
