FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="kafka" veriosn="3.6.2" author="wintech-nano"

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH
ENV LANG C.UTF-8

ENV KAFKA_VERSION 3.6.2
ENV KAFKA_BROKER_ID 1
ENV KAFKA_CFG_LISTENERS PLAINTEXT://:9092
ENV KAFKA_CFG_ADVERTISED_LISTENERS PLAINTEXT://:9092
ENV KAFKA_CFG_ZOOKEEPER_CONNECT localhost:2181

VOLUME /kafka-data

ADD start.sh /start.sh

RUN set -eux; \
    mkdir -p /tmp/kafka \
    && wget -O /tmp/kafka_2.13-$KAFKA_VERSION.tgz "https://archive.apache.org/dist/kafka/$KAFKA_VERSION/kafka_2.13-$KAFKA_VERSION.tgz" --no-check-certificate \
    && tar -zxvf /tmp/kafka_2.13-$KAFKA_VERSION.tgz -C /tmp/kafka \
    && mv /tmp/kafka/kafka_2.13-$KAFKA_VERSION /opt/kafka \
    && rm -rf /tmp/kafka_2.13-$KAFKA_VERSION.tgz \
    && rm -rf /tmp/kafka \
    && chmod a+x /start.sh \
    && sed -i 's,log.dirs=.*,log.dirs=/kafka-data,g' /opt/kafka/config/server.properties \
    && sed -i 's,#log.segment.bytes,log.segment.bytes,g' /opt/kafka/config/server.properties \
    && sed -i '$ a auto.create.topics.enable=false' /opt/kafka/config/server.properties

WORKDIR /opt/kafka

EXPOSE 9092
STOPSIGNAL SIGQUIT
CMD ["sh","/start.sh"]
