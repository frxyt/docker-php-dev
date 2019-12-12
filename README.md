# Docker Image for PHP development, by [FEROX](https://ferox.yt)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/frxyt/php-dev.svg)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/frxyt/php-dev.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/frxyt/php-dev.svg)
![GitHub issues](https://img.shields.io/github/issues/frxyt/docker-php-dev.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/frxyt/docker-php-dev.svg)

Use this image to increase your development speed. No need to create your own `Dockerfile`,
just ask this image to install missing packages and extensions on runtime through your `docker-compose.yml` !

This image is able to install Debian packages, PHP extensions (and configure them), enable Apache modules, with only the use of environment variables.
So, no need to create a `Dockerfile` for your develpment environment anymore.
It comes with Composer, Node.js, Xdebug, and Yarn too.
This image is also capable of highly increase performances on Docker for Mac/Windows too by enabling a cache for composer vendor path.

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
| 7.3         | `7.3-cli` | `7.3-apache`           | `7.3-fpm`    |
| 7.4         | `7.4-cli` | `7.4-apache`, `latest` | `7.4-fpm`    |

## Tools

* [Apache](https://httpd.apache.org/docs/current/) (\**depends on image variant*)
* [Composer](https://getcomposer.org/doc/)
* [cURL](https://curl.haxx.se/docs/manpage.html)
* [Git](https://git-scm.com/docs)
* [Lynx](https://lynx.invisible-island.net/lynx_help/)
* [Nano](https://www.nano-editor.org/docs.php)
* [Node.js](https://nodejs.org/en/docs/)
* [PHP](http://php.net/docs.php)
* [PHP CS Fixer](https://cs.symfony.com/)
* [PHP-FPM](http://php.net/manual/fr/install.fpm.configuration.php) (\**depends on image variant*)
* [PhpMetrics](https://github.com/phpmetrics/PhpMetrics)
* [rsync](https://download.samba.org/pub/rsync/rsync.html)
* [sshpass](https://linux.die.net/man/1/sshpass)
* [SVN](https://subversion.apache.org/docs/)
* [vim](https://www.vim.org/docs.php)
* [Xdebug](https://xdebug.org/docs/)
* [XHProf](https://www.php.net/manual/en/book.xhprof.php) or [Tideways XHProf](https://github.com/tideways/php-xhprof-extension)
* [Yarn](https://yarnpkg.com/lang/en/docs/)

## Variables

### Configurable environment variables

These environment variables can be overriden to change the default behavior of the image and adapt it to your needs:

| Name                                      | Type      | Example                                                              | Description
| :---------------------------------------- | :-------- | :------------------------------------------------------------------- | :----------
| `FRX_APACHE_ENABLE_MOD`                   | `string`  | `rewrite`                                                            | Enable Apache module, module names can be separated by spaces or new lines.
| `FRX_APACHE_DOCUMENT_ROOT`                | `string`  | `/var/www/html/public`                                               | Change Apache document root.
| `FRX_APT_GET_INSTALL`                     | `string`  | `libfreetype6-dev libgd-dev libjpeg62-turbo-dev libpng-dev`          | Install Debian packages, package names can be separated by spaces or new lines.
| `FRX_COMPOSER_VENDOR_CACHE_ENABLE`        | `integer` | `0` *(Off)* / `1` *(On)*                                             | Enable or disable cache for composer vendor path, defaults to `0`.
| `FRX_COMPOSER_VENDOR_CACHE_PATH`          | `string`  | `vendor`, `app/vendor`                                               | Set the path of composer vendor path to cache.
| `FRX_PECL_INSTALL`                        | `string`  | `xdebug`                                                             | Install PECL extension, extension names can be separated by spaces or new lines.
| `FRX_PHP_EXT_CONFIGURE`                   | `string`  | `gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/` | Configure PHP extension, multiple configurations can be separated by new lines.
| `FRX_PHP_EXT_ENABLE`                      | `string`  | `xdebug`                                                             | Enable PHP extension, extension names can be separated by spaces or new lines.
| `FRX_PHP_EXT_INSTALL`                     | `string`  | `gd`                                                                 | Install PHP extension, extension names can be separated by spaces or new lines.
| `FRX_PHP_INI`                             | `string`  | `date.timezone = "Europe/Paris"`                                     | Add settings to `php.ini`, multiple settings can be separated by new lines.
| `FRX_PHP_TIDEWAYS_XHPROF_CLOCK_USE_RDTSC` | `integer` | `0` *(Off)* / `1` *(On)*                                             | Enable or disable the use of TSC clock for Tideways XHProf, defaults to `0`.
| `FRX_PHP_XDEBUG_MAX_NESTING_LEVEL`        | `integer` | `256`                                                                | Max PHP call nested level used by Xdebug, defaults to `-1` (disabled).
| `FRX_PHP_XDEBUG_REMOTE_AUTOSTART`         | `integer` | `0` *(Off)* / `1` *(On)*                                             | Enable or disable Xdebug remote auto connect functionnality, defaults to `1`.
| `FRX_PHP_XDEBUG_REMOTE_CONNECT_BACK`      | `integer` | `0` *(Off)* / `1` *(On)*                                             | Enable or disable Xdebug remote connect back functionnality, defaults to `0`.
| `FRX_PHP_XDEBUG_REMOTE_ENABLE`            | `integer` | `0` *(Off)* / `1` *(On)*                                             | Enable or disable Xdebug remote functionnality, defaults to `1`.
| `FRX_PHP_XDEBUG_REMOTE_HOST`              | `string`  | `172.17.0.1`                                                         | Set remote IP address for Xdebug, defaults to Docker host IP address.
| `FRX_PHP_XDEBUG_REMOTE_PORT`              | `integer` | `9000`                                                               | Set remote port number for Xdebug, defaults to `9000`.
| `FRX_SCRIPT_START`                        | `string ` | `chown www-data:www-data -R .`                                       | Execute a script on container startup, one instruction per line.

### Readonly environment variables

Additionnaly, this image exposes some readonly variable that can be used in derived images:

| Name                                 | Type      | Example                                                              | Description
| :----------------------------------- | :-------- | :------------------------------------------------------------------- | :----------
| `FRX_DOCKER_FROM`                    | `string`  | `php:7.3-apache`                                                     | Base official PHP image used to build the image.
| `FRX_DOCKER_STARTED`                 | `integer` | `-1` *(error)* / `0` *(starting)* / `1` *(started)*                  | Indicate if the container is ready or not.

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
version: '3'

networks:
  backend:

services:

  mysql:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=TBD
      - MYSQL_DATABASE=TBD
      - MYSQL_USER=TBD
      - MYSQL_PASSWORD=TBD
    networks:
      - backend
    volumes:
      - ./var/lib/mysql:/var/lib/mysql:rw

  php:
    image: frxyt/php-dev:latest
    depends_on:
      - mysql
    environment:
      - FRX_PHP_EXT_INSTALL=pcntl pdo_mysql
      - FRX_APACHE_ENABLE_MOD=rewrite
      - FRX_APACHE_DOCUMENT_ROOT=/var/www/html/public
      - FRX_COMPOSER_VENDOR_CACHE_ENABLE=1
      - FRX_SCRIPT_START=chown www-data:www-data -R var
    networks:
      - backend
    ports:
      - 127.0.0.1:80:80
    volumes:
      - ./:/var/www/html:rw,cached
      - ./vendor:/frx/composer/vendor:rw
      - cache:/var/www/html/var/cache
      - vendor:/var/www/html/vendor

volumes:
  cache:
  vendor:
```

## Build

```sh
docker build -f ./php5.6/Dockerfile-apache -t frxyt/php-dev:5.6-apache .
docker build -f ./php5.6/Dockerfile-cli    -t frxyt/php-dev:5.6-cli    .
docker build -f ./php5.6/Dockerfile-fpm    -t frxyt/php-dev:5.6-fpm    .

docker build -f ./php7.0/Dockerfile-apache -t frxyt/php-dev:7.0-apache .
docker build -f ./php7.0/Dockerfile-cli    -t frxyt/php-dev:7.0-cli    .
docker build -f ./php7.0/Dockerfile-fpm    -t frxyt/php-dev:7.0-fpm    .

docker build -f ./php7.1/Dockerfile-apache -t frxyt/php-dev:7.1-apache .
docker build -f ./php7.1/Dockerfile-cli    -t frxyt/php-dev:7.1-cli    .
docker build -f ./php7.1/Dockerfile-fpm    -t frxyt/php-dev:7.1-fpm    .

docker build -f ./php7.2/Dockerfile-apache -t frxyt/php-dev:7.2-apache .
docker build -f ./php7.2/Dockerfile-cli    -t frxyt/php-dev:7.2-cli    .
docker build -f ./php7.2/Dockerfile-fpm    -t frxyt/php-dev:7.2-fpm    .

docker build -f ./php7.3/Dockerfile-apache -t frxyt/php-dev:7.3-apache .
docker build -f ./php7.3/Dockerfile-cli    -t frxyt/php-dev:7.3-cli    .
docker build -f ./php7.3/Dockerfile-fpm    -t frxyt/php-dev:7.3-fpm    .

docker build -f ./php7.4/Dockerfile-apache -t frxyt/php-dev:7.4-apache .
docker build -f ./php7.4/Dockerfile-cli    -t frxyt/php-dev:7.4-cli    .
docker build -f ./php7.4/Dockerfile-fpm    -t frxyt/php-dev:7.4-fpm    .
```

## License

This project and images are published under the [MIT License](LICENSE).

```
MIT License

Copyright (c) 2019 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
Copyright (c) 2019 Jérémy WALTHER <jeremy.walther@golflima.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```