# Docker Image for PHP development, by [FEROX](https://ferox.yt)

Use this image to increase your development speed. No need to create your own `Dockerfile`,
just ask this image to install missing packages and extensions on runtime through your `docker-compose.yml` !

This image is able to install Debian packages, PHP extensions (and configure them), enable Apache modules, with only the use of environment variables.
So, no need to create a `Dockerfile` for your develpment environment anymore.
It comes with Composer, Node.js, Yarn, and Xdebug too.

* Docker Hub: https://hub.docker.com/r/frxyt/php-dev
* GitHub: https://github.com/frxyt/docker-php-dev

## Docker Hub Image

**`frxyt/php-dev`**

## Tags

| PHP version | CLI only  | With Apache            | With php-fpm |
| :---------: | :-------- | :--------------------- | :----------- |
| 5.6         | `5.6-cli` | `5.6-apache`           | `5.6-fpm`    |
| 7.0         | `7.0-cli` | `7.0-apache`           | `7.0-fpm`    |
| 7.1         | `7.1-cli` | `7.1-apache`           | `7.1-fpm`    |
| 7.2         | `7.2-cli` | `7.2-apache`           | `7.2-fpm`    |
| 7.3         | `7.3-cli` | `7.3-apache`, `latest` | `7.3-fpm`    |

## Variables

| Name                                 | Type      | Example                                                              | Description
| :----------------------------------- | :-------- | :------------------------------------------------------------------- | :----------
| `FRX_APACHE_ENABLE_MOD`              | `string`  | `rewrite`                                                            | Enable Apache module, module names can be separated by spaces or new lines.
| `FRX_APACHE_DOCUMENT_ROOT`           | `string`  | `/var/www/html/public`                                               | Change Apache document root.
| `FRX_APT_GET_INSTALL`                | `string`  | `libfreetype6-dev libgd-dev libjpeg62-turbo-dev libpng-dev`          | Install Debian packages, package names can be separated by spaces or new lines.
| `FRX_PECL_INSTALL`                   | `string`  | `xdebug`                                                             | Install PECL extension, extension names can be separated by spaces or new lines.
| `FRX_PHP_EXT_CONFIGURE`              | `string`  | `gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/` | Configure PHP extension, multiple configurations can be separated by new lines.
| `FRX_PHP_EXT_ENABLE`                 | `string`  | `xdebug`                                                             | Enable PHP extension, extension names can be separated by spaces or new lines.
| `FRX_PHP_EXT_INSTALL`                | `string`  | `gd`                                                                 | Install PHP extension, extension names can be separated by spaces or new lines.
| `FRX_PHP_INI`                        | `string`  | `date.timezone = "Europe/Paris"`                                     | Add settings to `php.ini`, multiple settings can be separated by new lines.
| `FRX_PHP_XDEBUG_REMOTE_CONNECT_BACK` | `integer` | `0` (Off) / `1` (On)                                                 | Enable or disable Xdebug remote connect back functionnality, defauls to 0.
| `FRX_PHP_XDEBUG_REMOTE_ENABLE`       | `integer` | `0` (Off) / `1` (On)                                                 | Enable or disable Xdebug remote functionnality, defauls to 1.
| `FRX_PHP_XDEBUG_REMOTE_HOST`         | `string`  | `172.17.0.1`                                                         | Set remote IP address for Xdebug, defaults to Docker host IP address.
| `FRX_PHP_XDEBUG_REMOTE_PORT`         | `integer` | `9000`                                                               | Set remote port number for Xdebug, defaults to 9000.

## Example

To install PHP extension `gd`, you can use this sample `docker-compose.yml` file:

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
  ports:
    - 127.0.0.1:80:80
  volumes:
    - ./:/var/www/html:rw
```

To use this image with Symfony, you can simply use this sample `docker-compose.yml` file:

```yaml
mysql:
  image: mysql:5.7
  environment:
    - MYSQL_ROOT_PASSWORD=TBD
    - MYSQL_DATABASE=TBD
    - MYSQL_USER=TBD
    - MYSQL_PASSWORD=TBD
  volumes:
    - ./var/lib/mysql:/var/lib/mysql:rw

php:
  image: frxyt/php-dev:latest
  environment:
    - FRX_PHP_EXT_INSTALL=pcntl pdo_mysql
    - FRX_APACHE_ENABLE_MOD=rewrite
    - FRX_APACHE_DOCUMENT_ROOT=/var/www/html/public
  links:
    - mysql
  ports:
    - 127.0.0.1:80:80
  volumes:
    - ./:/var/www/html:rw
```