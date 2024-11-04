#!/bin/bash

envsubst '${DOMAIN_NAME}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

envsubst '${DOMAIN_NAME} ${ADMINER_DOMAIN}' < /etc/nginx/sites-available/wordpress.conf.template > /etc/nginx/sites-enabled/wordpress.conf
envsubst '${DOMAIN_NAME} ${ADMINER_DOMAIN}' < /etc/nginx/sites-available/adminer.conf.template > /etc/nginx/sites-enabled/adminer.conf
envsubst '${DOMAIN_NAME} ${STATIC_DOMAIN}' < /etc/nginx/sites-available/static_site.conf.template > /etc/nginx/sites-enabled/static_site.conf

nginx -g "daemon off;"
