#!/bin/bash
echo $ZOO_MY_ID > /zookeeper/myid
echo $ZOO_SERVERS >> /opt/kafka/config/zookeeper.properties
sh /opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties
