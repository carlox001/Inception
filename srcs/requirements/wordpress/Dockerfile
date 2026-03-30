FROM    debian:13.1

RUN apt-get update && apt-get install -y \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://packages.sury.org/php/README.txt | bash - && \
    apt-get update

RUN apt-get update && \
    apt-get install -y \
    mariadb-client \
    curl \
    zip \
    unzip \
    bash \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libfreetype6-dev \
    libonig-dev \
    php8.1-fpm \
    php8.1-mysqli \
    php8.1-pdo \
    php8.1-mbstring \
    php8.1-gd \
    php8.1-exif \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
    
RUN sed -i 's|listen = /run/php/php8.1-fpm.sock|listen = 9000|g' \
    /etc/php/8.1/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz --strip-components=1 \
    && rm wordpress.tar.gz
    
RUN chown -R www-data:www-data /var/www/html
    
ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm8.1", "-F"]
