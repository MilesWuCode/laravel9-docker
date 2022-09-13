#!/bin/sh

cd /var/www

php artisan optimize:clear
php artisan optimize

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
