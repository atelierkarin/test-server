# Building phrase
FROM composer as builder

WORKDIR '/app'

COPY ./composer*.json ./
RUN composer install

COPY . .

# Deployment phrase
FROM php:7.4-apache

WORKDIR /var/www/html

RUN a2enmod rewrite
RUN a2enmod headers
RUN a2dismod -f autoindex

# Copy something from builder phrase
COPY --from=builder /app /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]