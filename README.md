<em>This project has been created as part of the 42 curriculum by ankozako.</em>

# Description
The goal of inception is to create an infrastructure using Docker, which launches several services (MariaDB, Wordpress, NGINX) that communicate with each other in a secure manner. Through the project we learn about containerization, services coordination with Docker Compose, volume management and system configuration.

# Project Description

## Virtual Machines vs Docker 

### Virtual Machines
A virtual machine (VM) is like a virtual computer inside a physical computer. It can have a different operating system (OS) from the physical host computer. It is convenient when one needs a testing environment (for example to test a new OS), or just needs to work on two different OS, it is possible with using just one physical machine. The VM environment is also isolated, so if the VM crashes, the host computer remains unaffected.   

### Docker
The Docker is a system for packaging software into images - templates containing everything an application needs to run (code, dependencies etc). A container is a running instance of an image, an isolated process on the host machine that has it''s own system and interface. It is lighter and faster than a VM but less isolated, since the host kernel is still shared. 

## Secrets vs Environment Variables
### Secrets
Secrets comprise all the sensitive data that is not meant to be shared - passwords, certificates, token identification, etc. They are stored in a hidden file and never get exposed as plain environment variables.

### Environment Variables
Environment variables help create a reusable configuration, making the container easier to manage and deploy across environments. They are the right choice for non-sensitive data: database, domain and user names, where visibility doesn't pose any security concerns. 

## Docker Network vs Host Network
### Docker Network
Docker Network enables the Docker to communicate between containers and the host machine or external network. In the network, each container is reachable by others using its service name as a hostname. This project uses one to connect all three services while keeping them isolated from the host network.

### Host Network
Host Network removes the isolation altogether. A container using the host network shares the host's machine network directly.

## Docker Volumes vs Bind Mounts

### Docker Volumes
Docker volumes are storage locations fully managed by Docker itself, existing as first class objects that can be listed and inspected independently of specific containers. Since Docker manages them, they can easily be backed up, migrated and shared across containers. 
### Bind Mounts
Bind Mounts can be used to mount source code into the container, which will see the changes as soon as the file is saved. It means that processes can be run in the container, watching for changes in the file system, preventing data loss. If a docker container were to shut down, the bind mounted data should not be lost. 

To compare, Docker Volumes are easier to back up or migrate than bind mounts. Bind mounts create persistent volumes on the host machine while docker volumes do it on the docker host. 

# Instructions
1. Clone the repository into a Debian VM with Docker and Docker Compose installed.
2. Create srcs/.env with the required variables - domain name, database name, WordPress titles/usernames/emails.
3. Create the required files inside secrets/: db_password.txt, db_root_password.txt, credentials.txt
4. Add a host entry so the domain resolves locally: echo "127.0.0.1 ankozako.42.fr" | sudo tee -a /etc/hosts
5. From the root of the project run: make
6. Visit https://ankozako.42.fr in a browser

See USER_DOC.md and DEV_DOC.md for more details.

# Resources
Docker official documentation: https://docs.docker.com/reference/dockerfile/ <br>
Docker compose documentation: https://docs.docker.com/compose/ <br>
MariaDB documentation: https://hub.docker.com/_/mariadb <br>
NGINX documentation on configuring HTTPS servers: https://nginx.org/en/docs/ <br>
MarkDown syntax: https://www.markdownguide.org/basic-syntax/

# AI usage
AI was used for:
- help with understanding new concepts
- finding the right diagnostic commands for debugging and understanding the underlying issues
