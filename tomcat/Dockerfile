FROM ubuntu:jammy
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="tomcat" veriosn="9" author="wintech-nano"

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

WORKDIR /opt/tomcat9
ENV TOMCAT_MAJOR=9
ENV TOMCAT_VERSION=9.0.90

ENV OPEN_APM=false
ENV PROJECT_NAME="project"
ENV APM_IP_PROTOCOL="http"
ENV APM_IP="127.0.0.1"
ENV APM_PORT="8200"
ENV APM_ENV=dev
ENV APM_APPLICATION_PACKAGES="com.package"

RUN set -eux; \
    apt update  \
    && apt install -y wget \
    && mkdir -p /tmp/tomcat \
    && wget -O /tmp/tomcat.tar.gz "https://dlcdn.apache.org/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" --no-check-certificate \
    && tar -zxvf /tmp/tomcat.tar.gz -C /tmp/tomcat \
    && mv /tmp/tomcat/apache-tomcat-$TOMCAT_VERSION/* /opt/tomcat9 \
    && rm -rf /tmp/tomcat.tar.gz \
    && rm -rf /tmp/tomcat \
    && mkdir -p /opt/jmx \
    && mkdir -p /opt/apm_agent \
    && mv webapps webapps.dist \
    && mkdir webapps

COPY tomcat.yml /opt/jmx/tomcat.yml
COPY jmx_prometheus_javaagent-0.16.1.jar /opt/jmx/jmx_prometheus_javaagent-0.16.1.jar
COPY elastic-apm-agent-1.50.0.jar /opt/apm_agent/elastic-apm-agent-1.50.0.jar
COPY logging.properties /opt/tomcat9/conf/logging.properties

RUN set -eux; \
    sed -i '/^cygwin=false/i CATALINA_OPTS="\$CATALINA_OPTS -javaagent:/opt/jmx/jmx_prometheus_javaagent-0.16.1.jar=8079:/opt/jmx/tomcat.yml"' /opt/tomcat9/bin/catalina.sh \
    && sed -i '/^cygwin=false/i if [ \$OPEN_APM = true ]; then' /opt/tomcat9/bin/catalina.sh \
    && sed -i '/^cygwin=false/i \ \ \ \ CATALINA_OPTS="\$CATALINA_OPTS -javaagent:/opt/apm_agent/elastic-apm-agent-1.50.0.jar -Delastic.apm.service_name=\$PROJECT_NAME -Delastic.apm.server_urls=\$APM_IP_PROTOCOL://\$APM_IP:\$APM_PORT -Delastic.apm.environment=\$APM_ENV -Delastic.apm.application_packages=\$APM_APPLICATION_PACKAGES -Delastic.apm.secret_token="' /opt/tomcat9/bin/catalina.sh \
    && sed -i '/^cygwin=false/i fi' /opt/tomcat9/bin/catalina.sh \
    && sed -i '/^cygwin=false/i export CATALINA_OPTS' /opt/tomcat9/bin/catalina.sh \
    && cp -r /opt/tomcat9/webapps.dist/ROOT /opt/tomcat9/webapps/

EXPOSE 8079 8080 8200
ENTRYPOINT ["sh","/opt/tomcat9/bin/catalina.sh","run"]
STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]
