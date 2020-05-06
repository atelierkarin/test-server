# Building phrase
FROM composer as builder

WORKDIR '/app'

COPY ./composer*.json ./
RUN composer install

COPY . .

# Deployment phrase
FROM php:7.4-apache

WORKDIR /var/www/html

# Copy something from builder phrase
COPY --from=builder /app/* /var/www/html

RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]