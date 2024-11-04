FROM debian:11

ARG DOMAIN_NAME

RUN apt-get update -y && \
    apt-get install -y nginx openssl curl gettext

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=FR/ST=Nouvelle-Aquitaine/L=Angouleme/O=42/OU=42/CN=${DOMAIN_NAME}/UID=asuc" \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/${DOMAIN_NAME}.key \
    -out /etc/nginx/ssl/${DOMAIN_NAME}.crt

COPY conf/nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod 755 /var/www/
RUN chown -R www-data:www-data /var/www/

EXPOSE 443

ENTRYPOINT ["entrypoint.sh"]
