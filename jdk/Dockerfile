ARG BASE_IMAGE=ubuntu:jammy
FROM ${BASE_IMAGE}
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="jdk" author="wintech-nano"

ARG JDK_MAIN_VERSION=11
ENV JDK_MAIN_VERSION=${JDK_MAIN_VERSION}

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget openjdk-${JDK_MAIN_VERSION}-jdk

COPY jmx_prometheus_javaagent-0.16.1.jar /opt/jmx/jmx_prometheus_javaagent-0.16.1.jar
COPY elastic-apm-agent-1.50.0.jar /opt/apm_agent/elastic-apm-agent-1.50.0.jar