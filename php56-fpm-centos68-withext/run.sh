#!/bin/bash
nginx
/usr/local/php/sbin/php-fpm 
ps -ef 
tail -f /usr/local/nginx/logs/access.log