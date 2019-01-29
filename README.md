# Docker Image for PHP development, by FEROX

> Use this image to increase your development speed. No need to create your own `Dockerfile`,
> just ask this image to install missing packages and extensions on runtime through your `docker-compose.yml` !

## Example

To install PHP extensions `gd` and `pdo_mysql` you can use this sample `docker-compose.yml` file:

```yaml
php:
  image: frxyt/php-dev:latest
  environment:
    - |
      FRX_APT_GET_INSTALL=
      libfreetype6-dev
      libgd-dev
      libjpeg62-turbo-dev
      libpng-dev
    - |
      FRX_PHP_EXT_CONFIGURE=
      gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
    - |
      FRX_PHP_EXT_INSTALL=
      gd
```
