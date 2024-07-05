FROM grafana/grafana:10.3.4-ubuntu
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="grafana" veriosn="10.3.4-ubuntu" author="wintech-nano"

USER root
ENV TZ=Asia/Shanghai
ENV GF_DOMAIN=localhost

ADD custom.ini /etc/grafana/custom.ini
ADD set_domain.sh /tmp/set_domain.sh

ENV GF_CUSTOMER_PATHS_CONFIG=/etc/grafana/custom.ini
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /tmp/set_domain.sh \
    && sed -i '/^exec/i sh /tmp/set_domain.sh' /run.sh \
    && sed -i '/--config="\$GF_PATHS_CONFIG"/a  \ \ --config="\$GF_CUSTOMER_PATHS_CONFIG"                      \\' /run.sh
