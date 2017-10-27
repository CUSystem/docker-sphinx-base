#!/usr/bin/env bash

#Set the listen port which is all pretty sane.
LISTEN_PORT=${LISTEN_PORT:-80}
sed -i "s/listen\s*80;/listen $LISTEN_PORT;/g" /etc/nginx/conf.d/default.conf

#Setting or changing the location, which is less so.
if [[ -n $LOCATION ]]
then
  sed -i "s/location \/ {/location \/$LOCATION {/g" /etc/nginx/conf.d/default.conf
  mkdir /tmp/$LOCATION
  mv /usr/share/nginx/html/* /tmp/$LOCATION
  mv /tmp/$LOCATION /usr/share/nginx/html
fi

/usr/sbin/nginx -g 'daemon off;'