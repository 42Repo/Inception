FROM debian:11

RUN apt-get update -y && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysql wget mariadb-client 

RUN mkdir -p /var/www/adminer

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/adminer/index.php

RUN chown -R www-data:www-data /var/www/adminer

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
