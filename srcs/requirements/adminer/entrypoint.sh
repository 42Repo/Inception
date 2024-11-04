#!/bin/bash

mkdir -p /run/php

if [ ! -f /var/www/adminer/index.php ]; then
    wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/adminer/index.php
    chown -R www-data:www-data /var/www/adminer
fi

php-fpm7.4 -F
