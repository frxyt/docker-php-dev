# Copyright (c) 2019 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2019 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-php-dev> for details.

ARG FRX_DOCKER_FROM=php:apache
FROM ${FRX_DOCKER_FROM}

LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ./ /frx/

RUN /frx/build