FROM php:8.2-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
  git \
  unzip \
  libzip-dev \
  libonig-dev \
  && docker-php-ext-install zip pdo_mysql mbstring

# Enable Apache Rewrite Module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy Laravel files into container
COPY . /var/www/html

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html \
  && chmod -R 755 /var/www/html/storage

# Expose port 80
EXPOSE 80
