#!/bin/sh

cd /var/www

php artisan package:discover
php artisan optimize:clear
php artisan optimize
php artisan event:cache

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
