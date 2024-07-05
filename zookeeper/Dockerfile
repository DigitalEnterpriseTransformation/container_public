FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="zookeeper" veriosn="kafka_3.6.2" author="wintech-nano"

ENV TZ=Asia/Shanghai
RUN set -eux; \
    echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apt update  \
    && apt upgrade -y \
    && apt install -y --no-install-recommends tzdata wget openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH
ENV LANG=C.UTF-8

ENV KAFKA_VERSION=3.6.2
ENV ZOO_MY_ID=1
ENV ZOO_SERVERS="server.1=localhost:2888:3888;"

#数据存储
VOLUME /zookeeper
VOLUME /zookeeper-log

ADD start.sh /start.sh

RUN set -eux; \
    mkdir -p /tmp/kafka \
    && wget -O /tmp/kafka_2.13-$KAFKA_VERSION.tgz "https://archive.apache.org/dist/kafka/$KAFKA_VERSION/kafka_2.13-$KAFKA_VERSION.tgz" --no-check-certificate \
    && tar -zxvf /tmp/kafka_2.13-$KAFKA_VERSION.tgz -C /tmp/kafka \
    && mv /tmp/kafka/kafka_2.13-$KAFKA_VERSION /opt/kafka \
    && rm -rf /tmp/kafka_2.13-$KAFKA_VERSION.tgz \
    && rm -rf /tmp/kafka \
    && chmod a+x /start.sh \
    && sed -i 's,dataDir=.*,dataDir=/zookeeper,g' /opt/kafka/config/zookeeper.properties \
    && sed -i '$ a dataLogDir=/zookeeper-log' /opt/kafka/config/zookeeper.properties \
    && sed -i '$ a admin.serverPort=8087' /opt/kafka/config/zookeeper.properties \
    && sed -i '$ a tickTime=2000' /opt/kafka/config/zookeeper.properties \
    && sed -i '$ a initLimit=10' /opt/kafka/config/zookeeper.properties \
    && sed -i '$ a syncLimit=5' /opt/kafka/config/zookeeper.properties \
    && sed -i '$ a 4lw.commands.whitelist=*' /opt/kafka/config/zookeeper.properties

ENTRYPOINT ["sh","/start.sh"]

EXPOSE 2181 8087
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]
