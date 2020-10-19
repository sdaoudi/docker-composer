ARG ALPINE_VERSION=edge
FROM devilbox/php-fpm-8.0

LABEL maintainer="DAOUDI Soufian <soufian.daoudi2@gmail.com>"

ARG COMPOSER_VERSION=1.10.15
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


RUN mkdir ${COMPOSER_HOME} \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
    && php -r "unlink('composer-setup.php');"


ENV PHPIZE_DEPS ""
ENV HTTP_PROXY  ""
ENV HTTPS_PROXY ""
ENV NO_PROXY    ""

WORKDIR /var/www

COPY docker-entrypoint.sh /

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]


