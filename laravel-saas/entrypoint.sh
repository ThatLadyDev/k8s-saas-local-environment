#!/bin/bash

echo "Copying .env.example to .env..."
cp .env.example .env

# Set default values if they are not already set
export APP_ENV=${APP_ENV:-production}
export APP_URL=${APP_URL:-http://localhost}

# Use sed to replace or add lines in the .env file
sed -i "/^APP_ENV=/c\APP_ENV=$APP_ENV" .env || echo "APP_ENV=$APP_ENV" >> .env
sed -i "/^APP_URL=/c\APP_URL=$APP_URL" .env || echo "APP_URL=$APP_URL" >> .env

echo "Running composer install..."
composer install --no-dev --optimize-autoloader

# Check if APP_KEY is set in the .env file, and generate one if it's missing
if ! grep -q "^APP_KEY=" .env || [ -z "$(grep "^APP_KEY=" .env | cut -d '=' -f2)" ]; then
    echo "No APP_KEY set. Running php artisan key:generate..."
    php artisan key:generate
else
    echo "APP_KEY already set, skipping key generation."
fi

php artisan migrate

echo "Starting nginx and php-fpm..."
service nginx start && php-fpm