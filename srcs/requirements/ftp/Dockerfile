FROM debian:11

RUN apt-get update && apt-get install -y vsftpd netcat

RUN mkdir -p /usr/share/empty

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
