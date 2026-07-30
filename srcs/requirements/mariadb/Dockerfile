FROM    debian:13.1

EXPOSE 3306

RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN sed -i 's/bind-address[[:space:]]*=.*/bind-address = 0.0.0.0/' \
   /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/entrypoint.sh"]

CMD ["mysqld"]