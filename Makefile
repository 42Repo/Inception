COMPOSE_FILE = srcs/docker-compose.yml

all:
	mkdir -p /home/asuc/data/mariadb
	mkdir -p /home/asuc/data/wordpress
	docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	docker-compose -f $(COMPOSE_FILE) down

clean: down
	docker system prune -af
	docker volume ls -q | xargs -r docker volume rm

fclean: clean
	sudo rm -rf /home/asuc/data

re: fclean all
