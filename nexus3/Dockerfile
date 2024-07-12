FROM sonatype/nexus3:3.70.1-java17-alpine
MAINTAINER wintech-nano<webmaster@wintech-nano.com>
LABEL name="nexus3" veriosn="3.70.1-java17-alpine" author="wintech-nano"

USER root

RUN set -eux; \
    mkdir -p /opt/sonatype-work/nexus3/tmp \
    && chmod -R 777 /opt/sonatype-work/nexus3/tmp

USER nexus
