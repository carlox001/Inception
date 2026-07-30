FROM    debian:13.1

EXPOSE 443

RUN apt-get update && \
    apt-get install nginx -y openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
  
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl 

COPY /conf/nginx.conf /etc/nginx/conf.d

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]