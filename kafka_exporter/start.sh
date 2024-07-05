#!/bin/bash
sleep 30s
/opt/kafka_exporter/kafka_exporter --kafka.server=kafka:$KAFKA_PORT
