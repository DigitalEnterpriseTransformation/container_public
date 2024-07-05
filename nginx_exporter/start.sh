#!/bin/bash
sleep 30s
/opt/nginx_vts_exporter/nginx-vtx-exporter -nginx.scrape_uri=$NGINX_STATUS
