# Use the official PHP image with PHP-FPM
FROM php:8.1-fpm

# Install necessary dependencies for Laravel and Nginx
RUN apt-get update && apt-get install -y \
    nginx \
    libpng-dev libjpeg-dev libfreetype6-dev zip git unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/www/app
# Set the working directory to /var/www
WORKDIR /var/www/app

# Copy the Laravel application files into the container
COPY . .

# Install Composer dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader

# Expose the port that the container will listen on (this can be set dynamically using environment variables)
ENV APP_PORT=8000
EXPOSE $APP_PORT

# # Copy the Nginx configuration file into the container
# COPY ./nginx/default.conf /etc/nginx/sites-available/default

# Set up entrypoint to start both PHP-FPM and Nginx
CMD service nginx start && php-fpm