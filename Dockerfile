# Copyright (c) 2019 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2019 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-php-dev> for details.

ARG FRX_DOCKER_FROM=php:apache
FROM ${FRX_DOCKER_FROM}

LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_DISABLE_XDEBUG_WARN=1 \
    FRX_APACHE_DOCUMENT_ROOT= \
    FRX_APACHE_ENABLE_MOD= \
    FRX_APT_GET_INSTALL= \
    FRX_COMPOSER_VENDOR_CACHE_ENABLE=0 \
    FRX_COMPOSER_VENDOR_CACHE_PATH=vendor \
    FRX_DOCKER_FROM=${FRX_DOCKER_FROM} \
    FRX_PECL_INSTALL= \
    FRX_PHP_EXT_CONFIGURE= \
    FRX_PHP_EXT_ENABLE= \
    FRX_PHP_EXT_INSTALL= \
    FRX_PHP_INI= \
    FRX_PHP_XDEBUG_MAX_NESTING_LEVEL=-1 \
    FRX_PHP_XDEBUG_REMOTE_AUTOSTART=1 \
    FRX_PHP_XDEBUG_REMOTE_CONNECT_BACK=0 \
    FRX_PHP_XDEBUG_REMOTE_ENABLE=1 \
    FRX_PHP_XDEBUG_REMOTE_HOST=host.docker.internal \
    FRX_PHP_XDEBUG_REMOTE_PORT=9000 \
    FRX_SCRIPT_START=

COPY ./build ./Dockerfile ./LICENSE ./README.md  /frx/

VOLUME /frx/composer/vendor

RUN /frx/build