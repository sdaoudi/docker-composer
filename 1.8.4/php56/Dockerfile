ARG ALPINE_VERSION=3.5
FROM alpine:${ALPINE_VERSION}

LABEL maintainer="DAOUDI Soufian <soufian.daoudi2@gmail.com>"

ARG COMPOSER_VERSION=1.8.4
ARG HTTP_PROXY=""
ARG HTTPS_PROXY=""
ARG NO_PROXY=""

ENV PHPIZE_DEPS="autoconf g++ make icu-dev libxslt-dev"
ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY
ENV NO_PROXY=$NO_PROXY

RUN apk add --update libressl libressl-dev libssl1.0 redis \
    php5 \
    php5-apcu \
    php5-bcmath \
    php5-bz2 \
    php5-cli \
    php5-common  \
    php5-ctype \
    php5-curl \
    php5-dev \
    php5-dom \
    php5-exif \
    php5-gd \
    php5-gmp \
    php5-gettext \
    php5-iconv \
    php5-intl \
    php5-json \
    php5-ldap \
    php5-mcrypt \
    php5-memcache \
    php5-mysql \
    php5-mysqli \
    php5-opcache \
    php5-openssl \
    php5-pcntl \
    php5-pdo \
    php5-pdo_mysql \
    php5-pdo_pgsql \
    php5-pdo_sqlite \
    php5-pear \
    php5-phar \
    php5-posix \
    php5-soap \
    php5-xcache \
    php5-xml \
    php5-xmlreader \
    php5-xmlrpc \
    php5-xsl \
    php5-zip \
    php5-zlib \
    curl

# Install php addons
RUN apk add $PHPIZE_DEPS && \
    sed -i 's/^exec $PHP -C -n/exec $PHP -C/g' $(which pecl) && \
    pear config-set http_proxy $HTTP_PROXY && \
    pecl install mongo redis && \
    apk del --purge $PHPIZE_DEPS && \
    rm -rf /var/cache/apk/*

RUN apk --update add libtool make grep autoconf gcc libc-dev zlib-dev

RUN cd /tmp \
    && apk --update add cyrus-sasl-dev libmemcached-dev \
    && curl -L --progress-bar -o "php-memcached-2.2.0.tar.gz" "https://github.com/php-memcached-dev/php-memcached/archive/2.2.0.tar.gz" \
    && tar -xzvf php-memcached-2.2.0.tar.gz \
    && cd php-memcached-2.2.0 \
    && phpize \
    && ./configure --disable-memcached-sasl \
    && make \
    && make install \
    && cp modules/memcached.so /usr/lib/php5/modules/memcached.so \
    && echo "extension = memcached.so" >> /etc/php5/php.ini \
    && chmod -R +x /usr/lib/php5/modules/ \
    && cd .. \
    && rm -rf php-memcached-2.2.0 \
    && rm php-memcached-2.2.0.tar.gz

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar \
     -o /usr/bin/composer && chmod +x /usr/bin/composer

ENV HTTP_PROXY=""
ENV HTTPS_PROXY=""
ENV NO_PROXY=""

RUN addgroup -S www-data && adduser -D -g '' -G www-data www-data

RUN mkdir /var/www && chown -R www-data:www-data /var/www

USER www-data

WORKDIR /var/www
