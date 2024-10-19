all:
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker system prune -af
	docker volume rm -f $(docker volume ls -q)

re: clean all
