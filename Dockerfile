# Imagen base con PHP 8.1
FROM php:8.1-fpm

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Instala Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia los archivos de la aplicación
WORKDIR /var/www
COPY . .

# Establece los permisos
RUN chown -R www-data:www-data /var/www

# Instala dependencias de PHP con Composer
RUN composer install --no-dev --optimize-autoloader
# Ejecutar migraciones y cache
# Ejecutar migraciones y seeders
RUN php artisan migrate --force && \
    php artisan db:seed --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan storage:link

# Comando para iniciar PHP-FPM
CMD ["php-fpm"]
