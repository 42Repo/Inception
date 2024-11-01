FROM debian:11

RUN apt-get update -y && apt-get install -y mariadb-server

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
