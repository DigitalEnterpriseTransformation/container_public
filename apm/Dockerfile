ARG BASE_IMAGE=docker.elastic.co/apm/apm-server:7.17.22
FROM ${BASE_IMAGE}
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="apm-server" veriosn="7.17.22" author="wintech-nano"

ENV TZ=Asia/Shanghai
USER root
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/*
USER apm-server
