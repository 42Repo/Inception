#!/bin/bash

# Attendre que la base de données soit prête
until mysqladmin ping -h mariadb -u"$SQL_USER" -p"$SQL_PASSWORD"; do
    echo "Waiting for MariaDB to be up..."
    sleep 2
done

cd /var/www/wordpress


if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp config create \
        --dbname="$SQL_DATABASE" \
        --dbuser="$SQL_USER" \
        --dbpass="$SQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --path='/var/www/wordpress' \
        --allow-root

    wp core install \
        --url=https://${DOMAIN_NAME} \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="admin@asuc.42.fr" \
        --path='/var/www/wordpress' \
        --skip-email \
        --allow-root

    wp user create "$WP_USER" user@asuc.42.fr --user_pass="$WP_USER_PASSWORD" --role=author --path='/var/www/wordpress' --allow-root
fi

php-fpm7.4 -F

