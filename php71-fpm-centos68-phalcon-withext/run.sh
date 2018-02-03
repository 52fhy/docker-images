#!/bin/bash
cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
nginx
/usr/local/php/sbin/php-fpm
ps -ef
