FROM php:7.4-fpm

RUN curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y zip git libzip-dev && \
	docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip pdo pdo_mysql

RUN apt-get install -y gzip tar ca-certificates ssh jq

ENV DOCKERIZE_VERSION v0.6.1
RUN apt-get install -y wget && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
