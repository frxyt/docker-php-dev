# Docker Image for PHP development, by FEROX

> Use this image to increase your development speed. No need to create your own `Dockerfile`,
> just ask this image to install missing packages and extensions on runtime through your `docker-compose.yml` !

This image is able to install Debian packages, PHP extensions (and configure them), enable Apache modules, with only the use of environment variables.
So, no need to create a `Dockerfile` for your develpment environment anymore.
It comes with Node.js, Composer and Yarn too.

## Docker Hub Image

> `frxyt/php-dev`

## Tags

| PHP version | CLI only  | With Apache  | With php-fpm |
| :---------: | :-------- | :----------- | :----------- |
| 5.6         | `5.6-cli` | `5.6-apache` | `5.6-fpm`    |
| 7.0         | `7.0-cli` | `7.0-apache` | `7.0-fpm`    |
| 7.1         | `7.1-cli` | `7.1-apache` | `7.1-fpm`    |
| 7.2         | `7.2-cli` | `7.2-apache` | `7.2-fpm`    |
| 7.3         | `7.3-cli` | `7.3-apache` | `7.3-fpm`    |

## Variables

| Name                     | Type     | Example                                                              | Description
| :----------------------- | :------- | :------------------------------------------------------------------- | :----------
| `FRX_APT_GET_INSTALL`    | `string` | `libfreetype6-dev libgd-dev libjpeg62-turbo-dev libpng-dev`          | Install Debian packages, package names can be separated by spaces or new lines.
| `FRX_PHP_EXT_CONFIGURE`  | `string` | `gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/` | Configure PHP extension, multiple configurations can be separated by new lines.
| `FRX_PHP_EXT_INSTALL`    | `string` | `gd`                                                                 | Install PHP extension, extension names can be separated by spaces or new lines.
| `FRX_PHP_INI`            | `string` | `date.timezone = "Europe/Paris"`                                     | Add settings to `php.ini`, multiple settings can be separated by new lines.
| `FRX_APACHE_ENABLE_MOD`  | `string` | `rewrite`                                                            | Enable Apache module, module names can be separated by spaces or new lines.

## Example

To install PHP extension `gd` you can use this sample `docker-compose.yml` file:

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
