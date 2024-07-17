FROM ubuntu:bionic
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="python3.8.19" author="wintech-nano"


ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev libbz2-dev \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHON_VERSION=3.8.19

RUN set -eux; \
    wget "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz"  --no-check-certificate \
    && tar -xvf Python-${PYTHON_VERSION}.tar.xz -C /tmp \
    && cd /tmp/Python-${PYTHON_VERSION} \
    && ./configure --enable-optimizations \
    && make \
    && make install

RUN set -eux; \
    apt update  \
    && apt install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8

CMD ["/bin/bash"]
