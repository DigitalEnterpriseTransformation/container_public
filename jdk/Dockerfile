ARG BASE_IMAGE=ubuntu:jammy
FROM ${BASE_IMAGE}
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="jdk" author="wintech-nano"

ARG JDK_MAIN_VERSION=11
ENV JDK_MAIN_VERSION=${JDK_MAIN_VERSION}

ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8

RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget openjdk-${JDK_MAIN_VERSION}-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-${JDK_MAIN_VERSION}-openjdk-amd64