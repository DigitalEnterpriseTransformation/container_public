FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="pytorch" veriosn="1.13.1-cuda11.6-cudnn8-devel" author="wintech-nano"

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/*
