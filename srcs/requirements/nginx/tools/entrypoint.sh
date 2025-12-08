#!/bin/bash

set -x

if [ ! -f /etc/nginx/ssl/self-signed.crt ]; then
    echo "Generando certificato SSL..."
    openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
        -keyout /etc/nginx/ssl/self-signed.key \
        -out /etc/nginx/ssl/self-signed.crt \
        -subj "/C=IT/ST=Toscana/L=Firenze/O=42 Firenze/OU=IT/CN=cazerini.42.fr/emailAddress=cazerini@student.42firenze.it"
fi

nginx -g 'daemon off;'
