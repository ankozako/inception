# Description
The goal of Inception is to create an infrastructure using Docker, which launches several services (MariaDB, Wordpress, NGINX) that communicate with each other in a secure manner. Through the project we learn about containerization, services coordination with Docker Compose, volume management and system configuration.

# Project Description
This project uses Docker to containerize each part of a classic WordPress stack instead of running everything on one machine directly.
Each service (NGINX, WordPress and MariaDB) is isolated in its own container.
The srcs/ folder contains everything needed to build and run the stack: a docker-compose.yml and a requirements/ folder with one subfolder per service, where each has its own Dockerfile, configuration files, and a setup script if needed.

Key design choices: 
- Debian bookworm was chosen as the base image for every service, since it's the penultimate stable release at the time of writing.  
- Persistent data (the MariaDB database and WordPress files) is kept in named volumes configured to store their data at a specific host path as required. 
- Configuration is split between non-sensitive settings (.env) and sensitive credentials (secrets)
- WordPress is installed via WP-CLI so the container can start and configure itself without any manual step.

# Instructions
1. Clone the repository into a Debian VM with Docker and Docker Compose installed.
2. Create srcs/.env with the required variables - domain name, database name, WordPress titles/usernames/emails.
3. Create the required files inside secrets/: db_password.txt, db_root_password.txt, credentials.txt
4. Add a host entry so the domain resolves locally: echo "127.0.0.1 ankozako.42.fr" | sudo tee -a /etc/hosts
5. From the root of the project run: make
6. Visit https://ankozako.42.fr in a browser

See USER_DOC.md and DEV_DOC.md for more details.


