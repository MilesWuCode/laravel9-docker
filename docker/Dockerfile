FROM php:8.1-fpm

ARG NODE_VERSION=16

# 移動到工作目錄
WORKDIR /var/www

# 使用docker-php-extension-installer方便安裝
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# PHP安裝模組,參考sail
# docker-php-extension-installer 包含 sqlite3,curl,mbstring,readline
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
    pdo_pgsql gd \
    imap pdo_mysql \
    zip bcmath soap \
    intl \
    ldap

# 系統安裝軟體,參考sail,有包含supervisor
# debian使用default-mysql-client
# 最後安裝cron
RUN apt-get update && apt-get install -y \
    gnupg gosu curl ca-certificates zip unzip git supervisor sqlite3 libcap2-bin libpng-dev python2 \
    default-mysql-client \
    vim \
    nginx \
    cron

# 安裝composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 清除安裝後的快取檔案
RUN apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 建立使用者與群組
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# 專案複製到/var/www
COPY --chown=www:www-data . /var/www

# 專案環境變數
COPY --chown=www:www-data .env.production /var/www/.env

# 寫入權限:root,www
RUN chmod -R ug+w /var/www/storage

# 清除安裝後的快取檔案
RUN composer install --optimize-autoloader --no-dev
RUN composer clear-cache

# 放置設定檔
COPY docker/nginx.conf /etc/nginx/sites-enabled/default
COPY docker/php.ini /usr/local/etc/php/conf.d/app.ini
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 設定執行權限
RUN chmod +x /var/www/docker/run.sh

# 對外port
EXPOSE 80

# 啓動
ENTRYPOINT ["/var/www/docker/run.sh"]
