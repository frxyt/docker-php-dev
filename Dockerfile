FROM php:7.3.1-apache

LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN     DEBIAN_FRONTEND=noninteractive apt-get update \
    &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing --no-install-recommends \
            # base
            apt-utils \
            curl \
            gnupg \
            # composer & nodejs & yarn
            libzip-dev \
            unzip \
            yarn \
            # deploy
            git \
            sshpass \
            subversion \
    &&  curl -sS https://getcomposer.org/installer | php \
    &&  mv composer.phar /usr/local/bin/composer \
    &&  docker-php-ext-configure zip --with-zlib-dir\
    &&  docker-php-ext-install -j$(nproc) zip\
    &&  composer self-update \
    &&  curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    &&  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y --fix-missing --no-install-recommends \
            nodejs \
    &&  apt-get clean -y && apt-get clean -y && apt-get autoclean -y && rm -r /var/lib/apt/lists/*

COPY ./ /frx/

ENTRYPOINT ["/frx/start"]