FROM    debian:13.1

EXPOSE 443

RUN apt-get update && \
    apt-get install nginx -y openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    
RUN apk add --no-cache docker-cli    

RUN mkdir -p /etc/nginx/ssl 

#RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
#    -keyout /etc/nginx/ssl/self-signed.key \
#    -out /etc/nginx/ssl/self-signed.crt \
#    -subj "/C=IT/ST=Toscana/L=Firenze/O=42 Firenze/OU=IT/CN=cazerini.42.fr/emailAddress=cazerini@student.42firenze.it"

COPY /conf/nginx.conf /etc/nginx/conf.d

COPY /tools/index.html /var/www/html

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]