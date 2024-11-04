COMPOSE_FILE	= srcs/docker-compose.yml
DATA_DIR 		= /home/asuc/data

all: build up

build:
	docker-compose -f $(COMPOSE_FILE) build

up:
	mkdir -p $(DATA_DIR)/mariadb
	mkdir -p $(DATA_DIR)/wordpress
	mkdir -p $(DATA_DIR)/adminer
	mkdir -p $(DATA_DIR)/static_site
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down

clean: 
	docker system prune -af

fclean: down clean
	docker volume ls -q | xargs -r docker volume rm
	sudo rm -rf $(DATA_DIR)

re: fclean all

.PHONY: all build up down clean fclean re
