# Dockerfile
# Usando PHP con Apache
FROM php:8.1-apache

# Instalar dependencias
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

# Copiar archivos del proyecto
COPY . /var/www/html

# Copiar archivo .env y configurar variables de entorno
ENV DB_HOST=${MYSQL_HOST}
ENV DB_PORT=${MYSQL_PORT:-3306}
ENV DB_DATABASE=${MYSQL_DATABASE}
ENV DB_USERNAME=${MYSQL_USER}
ENV DB_PASSWORD=${MYSQL_PASSWORD}

# Instalar Composer y dependencias de Laravel
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer install --optimize-autoloader --no-dev

# Ejecutar migraciones y seeders, etc.
RUN php artisan migrate --force && \
    php artisan db:seed --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan storage:link

# Exponer puerto 80
EXPOSE 80
