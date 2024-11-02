COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	docker-compose -f $(COMPOSE_FILE) build

up:
	mkdir -p /home/asuc/data/mariadb
	mkdir -p /home/asuc/data/wordpress
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down

clean: down
	docker system prune -af
	docker volume ls -q | xargs -r docker volume rm

fclean: clean
	sudo rm -rf /home/asuc/data

re: fclean all

.PHONY: all build up down clean fclean re
