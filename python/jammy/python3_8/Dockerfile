FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="python3.8" author="wintech-nano"

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && apt install -y software-properties-common \
    && add-apt-repository --yes --update ppa:deadsnakes/ppa \
    && apt update \
    && apt install -y python3.8 libpython3.8-dev python3.8-dev python3.8-distutils \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2 \
    && apt remove --purge python3-apt -y \
    && apt install python3-apt -y \
    && cp /usr/lib/python3/dist-packages/apt_pkg.cpython-310-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.cpython-38m-x86_64-linux-gnu.so \
    && ln -fs /usr/lib/python3/dist-packages/apt_pkg.cpython-38m-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.so

RUN set -eux; \
    apt update  \
    && apt install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8

CMD ["/bin/bash"]
