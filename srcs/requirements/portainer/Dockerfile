FROM debian:11

RUN apt-get update && apt-get install -y \
    curl \
    apache2-utils \
    ca-certificates

RUN curl -L https://github.com/portainer/portainer/releases/download/2.21.4/portainer-2.21.4-linux-amd64.tar.gz -o portainer.tar.gz && \
    tar xzf portainer.tar.gz -C /opt && \
    rm portainer.tar.gz

ARG ADMIN_PASSWORD

RUN export ENCRYPTED_PASSWORD=$(htpasswd -nbB admin "$ADMIN_PASSWORD" | cut -d ":" -f 2) && \
    echo "$ENCRYPTED_PASSWORD" > /opt/admin_password.txt

EXPOSE 9000

CMD /opt/portainer/portainer --admin-password $(cat /opt/admin_password.txt) --host unix:///var/run/docker.sock
