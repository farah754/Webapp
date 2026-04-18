FROM php:8.2-cli

WORKDIR /app

# System dependencies
RUN apt-get update && apt-get install -y \
    unzip git curl zip libpq-dev libzip-dev \
    && docker-php-ext-install pdo pdo_pgsql zip

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy project
COPY . .

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Fix permissions
RUN chmod -R 775 storage bootstrap/cache

# 🔥 IMPORTANT FIX (ADD THIS)
RUN php artisan optimize:clear
RUN php artisan config:cache

# Expose port
EXPOSE 10000

# Start server
CMD php artisan serve --host=0.0.0.0 --port=10000