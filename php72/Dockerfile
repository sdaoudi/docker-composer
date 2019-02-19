ARG ALPINE_VERSION=3.8
FROM alpine:${ALPINE_VERSION}

LABEL maintainer="DAOUDI Soufian <soufian.daoudi2@gmail.com>"

ARG COMPOSER_VERSION=1.5.6
ARG MEMCACHED_VERSION=3.1.3

ARG HTTP_PROXY=""
ARG HTTPS_PROXY=""
ARG NO_PROXY=""

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY
ENV NO_PROXY=$NO_PROXY

RUN apk add --update libressl libressl-dev libssl1.0 curl redis \
    php7 \
    php7-apcu \
    php7-bcmath \
    php7-cli \
    php7-common \
    php7-ctype \
    php7-curl \
    php7-dev \
    php7-dom \
    php7-exif \
    php7-gd \
    php7-gmp \
    php7-gettext \
    php7-iconv \
    php7-imagick \
    php7-json \
    php7-intl \
    php7-mcrypt \
    php7-fileinfo\
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pear \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-sqlite3 \
    php7-redis \
    php7-mongodb \
    php7-zlib \
    php7-phar \
    php7-tokenizer \
    php7-session \
    php7-simplexml \
    php7-xmlwriter \
    php7-xml \
    php7-xsl \
    php7-zip

RUN  curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar \
     -o /usr/bin/composer && chmod +x /usr/bin/composer

RUN rm -rf /var/cache/apk/*
RUN rm -rf /tmp/*

ENV HTTP_PROXY=""
ENV HTTPS_PROXY=""
ENV NO_PROXY=""

RUN addgroup -S www-data && adduser -D -g '' -G www-data www-data

RUN mkdir /var/www && chown -R www-data:www-data /var/www

USER www-data

WORKDIR /var/www
