#!/bin/bash
if [ -f /var/filebeat/filebeat.yml ]; then
    cp /var/filebeat/filebeat.yml /etc/filebeat/filebeat.yml
fi
service filebeat restart
tail -f /dev/null