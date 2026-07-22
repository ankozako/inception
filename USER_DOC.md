# User Documentation
This document explains how to use the Inception stack as an end user or administrator. No development knowledge is required

## This stack provides the following services:
-**NGINX** - the entrypoint serving the site over HTTPS (port 443)
-**WordPress** - the websit itself
-**MariaDB** - stores WordPress data (posts, users, settings)


## Starting and stopping the project
From the project root:
Start:
	make (or make up)

Stop:
	make down

Stop without removing containers:
	make stop

Restart:
	make restart

Full reset (remove containers, volumes and host data):
	make fclean


## Accessing the website and admin panel
Website: https://ankozako.42.fr

WordPress admin dashboard: https://ankozako.42.fr/wp-admin

**Note: only HTTPS (port 443) works, HTTP (port 80) is intentionally not server.**

Your browser will show a self-signed certificate warning - this is expected, accept it (see README for more details).


## Locating and managing credentials
- Non-secret configuration is in srcs/.env
- Credentials are in individual files in secrets/, never committe to Git:
secrets/db_password.txt - MariaDB app user password
secrets/db_root_password.txt - MariaDB root password
secrets/credentials.txt - WordPress admin/user passwords
- To change a password: edit the relevant file in secrets/, then 'make re' to rebuild with the new value (this only affects fresh initialisation, see DEV_DOC.md for changing existing passwords)


## Checking that services run correctly
docker compose -f srcs/docker-compose.yml ps
- should show all three services as "up" 
