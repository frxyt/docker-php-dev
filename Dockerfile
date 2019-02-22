# Copyright (c) 2019 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2019 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-php-dev> for details.

ARG FRX_DOCKER_FROM=php:apache
FROM ${FRX_DOCKER_FROM}

LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    FRX_DOCKER_FROM=${FRX_DOCKER_FROM} \
    FRX_PHP_XDEBUG_MAX_NESTING_LEVEL=-1 \
    FRX_PHP_XDEBUG_REMOTE_AUTOSTART=1 \
    FRX_PHP_XDEBUG_REMOTE_CONNECT_BACK=0 \
    FRX_PHP_XDEBUG_REMOTE_ENABLE=1 \
    FRX_PHP_XDEBUG_REMOTE_HOST=host.docker.internal \
    FRX_PHP_XDEBUG_REMOTE_PORT=9000

COPY ./build /frx

RUN /frx/build