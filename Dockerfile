FROM php:7.3-fpm

RUN curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y zip libzip-dev gzip tar ca-certificates git ssh && \
	docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip
