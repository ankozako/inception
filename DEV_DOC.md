# Developer Documentation
This document explains how to set up, build and work on Inception from a developer's point of view. 

## Prerequisites
A Debian VM (this project was developed on Debian 13 "Trixie" s the VM OS, with containers built from Debian:bookworm), Docker Engine and Docker Compose installed.

## Setting up the environment
1. clone the repository: git clone <repo-url> inception
2. Create srcs/.env from the template: cp srcs/.env.example srcs/.env and fill in DOMAIN_NAME (yourlogin.42.fr) and other non-secret values
3. Create the secrets/ files (not committed to Git - see .gitignore): secrets/db_password.txt secrets/db_root_password.txt secrets/credentials.txt Each shoould contain a single password (or KEY=value pairs for credentials.txt - see file for expected format)
4. Add a host entry so the domain resolves locally: echo "127.0.0.1 yourlogin.42.fr" | sudo tee-a/etc/hosts

## Building and launching the project using the Makefile and Docker Compose
- make - sets up hosts entry and builds and starts everything
- make build - builds images only
- make down - stops and removes containers, keeps volumes
- make stop/start - stop or start without removing containers
- make restart - down, then up
- make re - full rebuild from clean state
- make fclean - removes containers, images, volumes and host data

## Relevant commands to manage containers and volumes
docker compose -f srcs/docker-compose.yml ps
- lists all containers defined in the compose file, along with their current status and which service they belong to (fast way to check whether everything is running without browsing logs)

docker compose -f srcs/docker-compose.yml logs -f <service> 
- log output for a specific service (e.g. wordpress, mariadb, nginx), prints log as it happens, useful for catching errors etc. Press CTRL + C to stop following

docker exec -it <container> bash 
- opens shell inside a running container, useful for debugging

docker volume ls
- lists every docker-managed named volume known to the Docker on this host, useful for checking if volumes exist

docker volume inspect srcs_mariadb_data
- shows detailed metadata about one specific volume, useful for checking that volume stores its data at a location

docker network ls
- lists all Docker network on the host across all projects, useful to confirm the bridge network exists

## Where the project data is stored and how it persists
MariaDB data: named volume 'mariadb_data', backed by host path /home/<login>/data/mariadb
WordPress data: named volume 'wordpress_data', backed by host path /home/<login>/data/wordpress
- data survives 'docker compose down' and continer restarts sincce it lives in the volume, and not in the container's writable layer
- data is removed by make fclean (or manual 'docker volume rm')
