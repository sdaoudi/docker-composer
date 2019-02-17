# Composer alpine docker image #

A minimal Dockerfile based on alpine image.

## What's included ##

Multiple version of composer with php 5.6 
and php 7.2.

## Available tags ##

- sdaoudi/composer:1.5.6-php56
- sdaoudi/composer:1.5.6-php72
- sdaoudi/composer:1.6.5-php56
- sdaoudi/composer:1.6.5-php72
- sdaoudi/composer:1.8.4-php56
- sdaoudi/composer:1.8.4-php72

## Usage examples ##

Composer 1.5.6 with php 5.6 example:

    $ docker run --rm -ti sdaoudi/composer:1.5.6-php56 php -v

Composer 1.6.5 with php 7.2 example:

    $ docker run --rm -ti sdaoudi/composer:1.6.5-php72 composer -v

## Working directory ##

You can use ``/src`` as a working directory:

	$ docker run --rm -ti sdaoudi/composer:1.8.4-php72 pwd

## Default user ##

We use ``www-data`` as default user of this image:

	$ docker run --rm -ti sdaoudi/composer:1.8.4-php56 whoami
