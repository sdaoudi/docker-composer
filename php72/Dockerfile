ARG ALPINE_VERSION=3.9
FROM alpine:${ALPINE_VERSION}

LABEL maintainer="DAOUDI Soufian <soufian.daoudi2@gmail.com>"

ARG COMPOSER_VERSION=1.5.6
ARG MEMCACHED_VERSION=3.1.3

ARG HTTP_PROXY=""
ARG HTTPS_PROXY=""
ARG NO_PROXY=""

ENV HTTP_PROXY  $HTTP_PROXY
ENV HTTPS_PROXY $HTTPS_PROXY
ENV NO_PROXY    $NO_PROXY

ENV COMPOSER_ALLOW_SUPERUSER    1
ENV COMPOSER_HOME               "/composer"
ENV PHP_MEMORY_LIMIT            512M

RUN apk add --update libressl libressl-dev libssl1.1 \
    curl \
    redis \
    su-exec \
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

RUN mkdir ${COMPOSER_HOME} \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
    && php -r "unlink('composer-setup.php');"

# Clean caches
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

ENV PHPIZE_DEPS ""
ENV HTTP_PROXY  ""
ENV HTTPS_PROXY ""
ENV NO_PROXY    ""

RUN addgroup -S www-data && adduser -D -g '' -G www-data www-data

RUN mkdir /var/www

WORKDIR /var/www

COPY docker-entrypoint.sh /

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
