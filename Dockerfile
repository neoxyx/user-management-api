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

# Comando para iniciar PHP-FPM
CMD ["php-fpm", "php artisan serve --host=0.0.0.0 --port=8000"]
