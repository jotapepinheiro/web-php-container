#!bin/sh

PHP_VERSION=7
gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /

#Essentials
# sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories
apk upgrade --update-cache --available
cat /etc/alpine-release
apk add musl-dev libaio libnsl autoconf libc6-compat gcompat && apk add --update make
apk add gcc;
apk add pcre
apk add curl
apk add nginx
apk add php$PHP_VERSION 
apk add php$PHP_VERSION-fpm
apk add php$PHP_VERSION-opcache 
apk add php$PHP_VERSION-json 
apk add php$PHP_VERSION-mbstring  
apk add php$PHP_VERSION-session 
apk add php$PHP_VERSION-ctype  
apk add php$PHP_VERSION-zlib
apk add php$PHP_VERSION-curl
apk add php$PHP_VERSION-openssl
apk add php$PHP_VERSION-mysqlnd
apk add php$PHP_VERSION-pdo
apk add php$PHP_VERSION-pdo_mysql
apk add php$PHP_VERSION-tokenizer
apk add php$PHP_VERSION-xml
apk add php$PHP_VERSION-dom
apk add php$PHP_VERSION-dev 
apk add php$PHP_VERSION-pear
apk add php$PHP_VERSION-sockets
apk add php$PHP_VERSION-fileinfo
apk add php$PHP_VERSION-xmlwriter
apk add php$PHP_VERSION-simplexml
apk add composer

sh /tmp/oci8.sh

#Nginx
# mkdir /run/nginx
mkdir -p /var/www/html/

mv /tmp/nginx.conf /etc/nginx/
mv /tmp/www.conf /etc/php7/php-fpm.d/www.conf
mkdir -p /var/www/html/public/

echo "<?php phpinfo(); ?>" > /var/www/html/public/index.php

rm -r /tmp/*
