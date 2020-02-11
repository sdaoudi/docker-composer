# Composer alpine docker image #

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/sdaoudi/docker-composer.svg?branch=master)](https://travis-ci.org/sdaoudi/docker-composer)

A minimal Dockerfile based on alpine image.

## What's included ##

Multiple version of composer with php 5.6 
and php 7.2.

## Available tags ##

- PHP56:
    - sdaoudi/composer:1.5.6-php56
    - sdaoudi/composer:1.6.5-php56
    - sdaoudi/composer:1.7.3-php56
    - sdaoudi/composer:1.8.4-php56

- PHP72:
    - sdaoudi/composer:1.5.6-php72
    - sdaoudi/composer:1.6.5-php72
    - sdaoudi/composer:1.7.3-php72
    - sdaoudi/composer:1.8.4-php72
    - sdaoudi/composer:1.9.3-php72

## Usage examples ##

Composer 1.5.6 with php 5.6 example:

    $ docker run --rm -ti sdaoudi/composer:1.5.6-php56 php -v

Composer 1.6.5 with php 7.2 example:

    $ docker run --rm -ti sdaoudi/composer:1.6.5-php72 composer -v

## Working directory ##

You can use ``/var/www`` as a default working directory:

	$ docker run --rm -ti sdaoudi/composer:1.8.4-php72 pwd

## Available PHP extensions (Modules) ##

&nbsp;     | &nbsp;    | &nbsp;  | &nbsp;  | &nbsp; | &nbsp;  | &nbsp;| &nbsp;
---        | ---       | ---     | ---     |---     |---      |---    |---
apcu       | bcmath    | bz2     | cli     | ctype  | curl    | dom   | exif  
gd         | gmp       | gettext | iconv   | intl   | json    | ldap  | mcrypt
memcache   | memcached | mysql   | opcache | redis  | openssl | pcntl | pdo   
mongo      | pear      | phar    | posix   | xcache | xml     | xsl   | zip   

## Build command ##

You can build a composer image with this command:

```
$ make build PHP_VERSION=56 COMPOSER_VERSION=1.6.5
```
