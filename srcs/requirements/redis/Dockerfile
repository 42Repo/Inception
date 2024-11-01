FROM debian:11

RUN apt-get update && apt-get install -y redis-server

COPY conf/redis.conf /etc/redis/redis.conf

ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]
