FROM debian:11

RUN apt-get update -y && \
    apt-get install -y nginx openssl curl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=FR/ST=Nouvelle-Aquitaine/L=Angouleme/O=42/OU=42/CN=${DOMAIN_NAME}/UID=asuc" \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/asuc.42.fr.key \
    -out /etc/nginx/ssl/asuc.42.fr.crt

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod 755 /var/www/
RUN chown -R www-data:www-data /var/www/

ENTRYPOINT ["entrypoint.sh"]

