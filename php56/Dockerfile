ARG ALPINE_VERSION=3.8
FROM alpine:${ALPINE_VERSION}

LABEL maintainer="DAOUDI Soufian <soufian.daoudi2@gmail.com>"

ARG COMPOSER_VERSION=1.5.6
ARG MEMCACHED_VERSION=2.2.0

ARG HTTP_PROXY=""
ARG HTTPS_PROXY=""
ARG NO_PROXY=""

ENV HTTP_PROXY  $HTTP_PROXY
ENV HTTPS_PROXY $HTTPS_PROXY
ENV NO_PROXY    $NO_PROXY

ENV COMPOSER_ALLOW_SUPERUSER    1
ENV COMPOSER_HOME               "/composer"
ENV PHP_MEMORY_LIMIT            512M

RUN apk add --update libressl \
    libmemcached-dev \
    libressl-dev \
    libssl1.0 \
    redis \
    curl \
    su-exec \
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
    php5-xml \
    php5-xmlreader \
    php5-xmlrpc \
    php5-xsl \
    php5-zip \
    php5-zlib \
    && sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php5/php.ini

RUN ln -s /usr/bin/php5 /usr/bin/php \
    && ln -s /usr/bin/phpize5 /usr/bin/phpize \
	&& ln -s /usr/bin/php-config5 /usr/bin/php-config

ENV PHPIZE_DEPS " \
        autoconf \
        g++ \
        make \
        icu-dev \
        libxslt-dev \
    "

# Install php addons
RUN apk add $PHPIZE_DEPS \
    && sed -i 's/^exec $PHP -C -n/exec $PHP -C/g' $(which pecl) \
    && pecl install mongo memcache redis memcached-${MEMCACHED_VERSION} \
    && apk del --purge $PHPIZE_DEPS

RUN echo "extension = memcache.so" >> /etc/php5/php.ini \
    && echo "extension = mongo.so" >> /etc/php5/php.ini \
    && echo "extension = memcached.so" >> /etc/php5/php.ini \
    && echo "extension = redis.so" >> /etc/php5/php.ini \
    && chmod -R +x /usr/lib/php5/modules/

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

RUN addgroup -S www-data && adduser -D -g '' -G www-data www-data \

RUN mkdir /var/www

WORKDIR /var/www

COPY docker-entrypoint.sh /

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
