#!/bin/bash
sleep 30s
/opt/zookeeper_exporter/zookeeper_exporter -zookeeper zookeeper:$ZOOKEEPER_PORT -bind-addr :9143
