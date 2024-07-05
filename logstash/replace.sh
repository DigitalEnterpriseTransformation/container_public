#!/bin/bash
sed -i 's/$ELASTICSEARCH_PORT/'$ELASTICSEARCH_PORT'/g' /usr/share/logstash/pipeline/logstash.conf
