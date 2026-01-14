FROM php:8.2-fpm-alpine

EXPOSE 9000

RUN apk add --no-cache \
        mariadb-client \
        curl \
        zip \
        unzip \
        bash \
        libpng-dev \
        libjpeg-turbo-dev \
        libwebp-dev \
        freetype-dev \
        oniguruma-dev \
        && docker-php-ext-install pdo pdo_mysql mbstring gd exif

WORKDIR /var/www/html
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz --strip-components=1 \
    && rm wordpress.tar.gz

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm", "-F"]
