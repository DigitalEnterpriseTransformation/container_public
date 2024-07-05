#!/bin/bash
sed -i 's|domain =.*|domain = '$GF_DOMAIN'|g' /etc/grafana/custom.ini
