ARG FRX_DOCKER_FROM=php:cli
FROM ${FRX_DOCKER_FROM}

LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ./ /frx/

RUN /frx/build

ENTRYPOINT ["/frx/start"]