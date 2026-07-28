all:
	mkdir -p /home/ankozako/data/mariadb
	mkdir -p /home/ankozako/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

fclean: down
	docker volume rm -f srcs_mariadb_data srcs_wordpress_data
	docker network rm -f srcs_inception_network
	sudo rm -rf /home/ankozako/data

re: fclean all

.PHONY: all down fclean re
