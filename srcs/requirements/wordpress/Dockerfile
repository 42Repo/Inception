FROM debian:11

RUN apt-get update -y && \
    apt-get install -y php7.4 php-fpm php-mysql wget mariadb-client procps

RUN mkdir -p /var/www/wordpress

RUN wget https://fr.wordpress.org/wordpress-6.6.2-fr_FR.tar.gz -O /tmp/wordpress.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www/ && \
    rm /tmp/wordpress.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/conf.php.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
