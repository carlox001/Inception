#!/bin/bash
set -euo pipefail

# If the first argument starts with '-', prepend "php-fpm"
if [ "${1:0:1}" = '-' ]; then
    set -- php-fpm "$@"
fi

# Copy wp-config if not exists
if [ ! -e /var/www/html/wp-config.php ]; then
    echo "Generating wp-config.php..."
    cp /usr/src/wordpress/wp-config-docker.php /var/www/html/wp-config.php
    chown www-data:www-data /var/www/html/wp-config.php
fi

# Ensure permissions for WordPress
chown -R www-data:www-data /var/www/html

exec "$@"
