#!/usr/bin/env bash

LISTEN_PORT=${LISTEN_PORT:-80}

sed -i "s/listen\s*80;/listen $LISTEN_PORT;/g" /etc/nginx/conf.d/default.conf
sed -i "s/location \/ {/location \/$LOCATION {/g" /etc/nginx/conf.d/default.conf

/usr/sbin/nginx -g 'daemon off;'