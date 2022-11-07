all:	up

up:
	@printf "Creating and starting containers...\n"
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d

down:
	@printf "Stopping and removing containers, networks...\n"
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down

clean:
	@printf "Stopping and removing containers, networks, images, volumes...\n"
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down --rmi local --volumes
	@sudo rm -rf ~/data/mariadb
	@sudo rm -rf ~/data/wordpress

re:	clean up

.PHONY	: all build down re clean
