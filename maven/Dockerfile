ARG BASE_IMAGE=wintechnano/jdk:11-jammy
FROM ${BASE_IMAGE}

ARG MAVEN_VERSION=3.9.6
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="maven" veriosn="${MAVEN_VERSION}" author="wintech-nano"

ENV LANG=C.UTF-8

ENV MAVEN_VERSION=${MAVEN_VERSION}
RUN set -eux; \
    mkdir -p /tmp/maven \
    && wget -O /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz "https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" --no-check-certificate \
    && tar -zxvf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /tmp/maven \
    && mkdir -p /opt/maven \
    && mv /tmp/maven/apache-maven-${MAVEN_VERSION}/* /opt/maven \
    && mkdir -p /root/.m2/repository \
    && rm -rf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && rm -rf /tmp/maven

ENV M2_HOME=/opt/maven
ENV PATH=$M2_HOME/bin:$PATH
