# Building phrase
FROM composer as builder

WORKDIR '/app'

COPY ./composer*.json ./
RUN composer install

COPY . .

# Deployment phrase
FROM php:7.4-apache

WORKDIR /var/www/html

EXPOSE 80

# Copy something from builder phrase
COPY --from=builder /app/vendor /var/www/html
