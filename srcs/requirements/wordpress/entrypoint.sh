#!/bin/bash

until mysqladmin ping -h mariadb -u"${SQL_USER}" -p"${SQL_PASSWORD}"; do
    echo "Waiting for MariaDB to be up..."
    sleep 2
done

until redis-cli -h redis -p 6379 ping | grep -q PONG; do
    echo "Waiting for Redis to be up..."
    sleep 2
done

mkdir -p /run/php

cd /var/www/wordpress

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp config create \
        --dbname="${SQL_DATABASE}" \
        --dbuser="${SQL_USER}" \
        --dbpass="${SQL_PASSWORD}" \
        --dbhost="mariadb:3306" \
        --path='/var/www/wordpress' \
        --allow-root

    if ! grep -q "define('WP_REDIS_HOST', 'redis');" /var/www/wordpress/wp-config.php; then
        sed -i "/^\/\* That's all, stop editing! Happy publishing. \*\//i \
        define('WP_REDIS_HOST', 'redis');\n\
        define('WP_REDIS_PORT', 6379);\n\
        define('WP_REDIS_DATABASE', 0);\n\
        define('WP_REDIS_TIMEOUT', 1);\n\
        define('WP_REDIS_READ_TIMEOUT', 1);\n\
        define('WP_REDIS_PREFIX', 'my_site');\n" /var/www/wordpress/wp-config.php
    fi

    wp core install \
        --url="https://${DOMAIN_NAME}" \
        --title="Inception" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="admin@asuc.42.fr" \
        --path='/var/www/wordpress' \
        --skip-email \
        --allow-root
fi

if ! wp user get "${WP_USER}" --path='/var/www/wordpress' --allow-root > /dev/null 2>&1; then
    wp user create "${WP_USER}" user@asuc.42.fr --user_pass="${WP_USER_PASSWORD}" --role=author --path='/var/www/wordpress' --allow-root
fi

wp plugin install redis-cache --allow-root
if ! wp plugin is-active redis-cache --allow-root; then
    wp plugin activate redis-cache --allow-root
fi

wp redis enable --allow-root --path=/var/www/wordpress

php-fpm7.4 -F
