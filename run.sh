#!/bin/bash

mkdir -p /etc/nginx/snippets/
mkdir -p /etc/nginx/certs/
cd /etc/nginx/certs/

if [ ! -f cert.pem ] || [ ! -f key.pem ]; then
  openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout cert.key -out cert.crt -days 365
fi

if [ ! -f dhparam.pem ] && [ ! -z ${USE_DH+x} ]; then
 openssl dhparam -out dhparam.pem 4096
 echo """
 ssl_dhparam /etc/nginx/certs/dhparam.pem;
 ssl_ecdh_curve secp384r1;
 """ > /etc/nginx/snippets/dhparm.conf
fi

sed -i -e "s|XX_REMOTE_URL_XX|$REMOTE_URL|g" /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
