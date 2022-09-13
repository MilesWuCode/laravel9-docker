#!/bin/sh

cd /var/www

php artisan cache:clear
php artisan config:cache
php artisan route:cache

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf