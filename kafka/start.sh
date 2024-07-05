#!/bin/bash
sed -i 's,broker.id=.*,broker.id='$KAFKA_BROKER_ID',g' /opt/kafka/config/server.properties
sed -i 's,#listeners=.*,listeners='$KAFKA_CFG_LISTENERS',g' /opt/kafka/config/server.properties
sed -i 's,#advertised.listeners=.*,advertised.listeners='$KAFKA_CFG_ADVERTISED_LISTENERS',g' /opt/kafka/config/server.properties
sed -i 's,zookeeper.connect=.*,zookeeper.connect='$KAFKA_CFG_ZOOKEEPER_CONNECT',g' /opt/kafka/config/server.properties
sh /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
