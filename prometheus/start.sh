#!/bin/bash
if [ -f /opt/prometheus/config/prometheus.yml ]; then
  ./prometheus --config.file=config/prometheus.yml
else
  ./prometheus --config.file=prometheus.yml
fi
