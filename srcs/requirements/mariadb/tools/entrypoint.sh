#!/bin/bash
set -e

# Avvia il server MariaDB in background
mysqld_safe &

# Attendi che MariaDB si avvii completamente
until mysqladmin ping --silent; do
  echo "Aspettando MariaDB..."
  sleep 1
done

# Crea il database e l'utente se non esistono già
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# A questo punto, fermiamo il processo mysqld_safe
wait
