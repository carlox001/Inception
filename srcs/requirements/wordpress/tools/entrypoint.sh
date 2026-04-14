#!/bin/bash
set -e

echo "Starting WordPress entrypoint..."

# Wait for database to be ready
echo "Waiting for database..."
while ! mysql -h mariadb -u test -ppass -e "SELECT 1" > /dev/null 2>&1; do
    echo "Database not ready, waiting..."
    sleep 2
done
echo "Database is ready."

# Crea la configurazione WordPress se non esiste

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Creating WordPress config..."
    cp -r /var/www/wordpress/* /var/www/html/
    wp config create \
       --dbname="$DB_NAME" \
       --dbuser="$DB_USER" \
       --dbpass="$DB_PASSWORD" \
       --dbhost="$DB_HOST" \
       --path=/var/www/html \
       --allow-root
    echo "Config created."
fi

# Installa WordPress se non è già installato

if ! wp core is-installed --path=/var/www/html --allow-root 2>/dev/null; then

    echo "Installazione di WordPress..."

    wp core install \
       --url="https://$DOMAIN_NAME" \
       --title="$WP_TITLE" \
       --admin_user="$WP_ADMIN_USER" \
       --admin_password="$WP_ADMIN_PASSWORD" \
       --admin_email="$WP_ADMIN_EMAIL" \
       --path=/var/www/html \
       --allow-root

    # Crea utente secondario

    wp user create "$WP_USER" "$WP_EMAIL" \
       --user_pass="$WP_PASSWORD" \
       --role=author \
       --path=/var/www/html \
       --allow-root

    echo "WordPress installato con successo!"
fi

echo "Starting PHP-FPM..."
# Start PHP-FPM
exec "$@"
