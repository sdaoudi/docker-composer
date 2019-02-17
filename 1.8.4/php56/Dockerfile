ARG ALPINE_VERSION=3.5
FROM alpine:${ALPINE_VERSION}

LABEL maintainer="DAOUDI Soufian <soufian.daoudi2@gmail.com>"

ARG COMPOSER_VERSION=1.8.4

RUN apk add --update \
    php5 \
    php5-apcu \
    php5-bcmath \
    php5-bz2 \
    php5-cli \
    php5-ctype \
    php5-curl \
    php5-dom \
    php5-exif \
    php5-gd \
    php5-gettext \
    php5-iconv \
    php5-intl \
    php5-json \
    php5-mcrypt \
    php5-memcache \
    php5-mysql \
    php5-mysqli \
    php5-openssl \
    php5-pcntl \
    php5-pdo_mysql \
    php5-pdo_pgsql \
    php5-pdo_sqlite \
    php5-phar \
    php5-posix \
    php5-soap \
    php5-xcache \
    php5-xmlreader \
    php5-xmlrpc \
    php5-xsl \
    php5-zip \
    php5-zlib \
    curl \
    make

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar \
     -o /usr/bin/composer && chmod +x /usr/bin/composer

RUN addgroup -S www-data && adduser -D -g '' -G www-data www-data

USER www-data

WORKDIR /src
