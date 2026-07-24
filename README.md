<em>This project has been created as part of the 42 curriculum by ankozako.</em>

# Description
The goal of inception is to create an infrastructure using Docker, which launches several services (MariaDB, Wordpress, NGINX) that communicate with each other in a secure manner. Through the project we learn about containerization, services coordination with Docker Compose, volume management and system configuration.

# Project Description

## Virtual Machines vs Docker 

### Virtual Machines
A virtual machine (VM) is like a virtual computer inside a physical computer. It can have a different operating system (OS) from the physical host computer. It is convenient when one needs a testing environment (for example to test a new OS), or just needs to work on two different OS, it is possible with using just one physical machine. The VM environment is also isolated, so if the VM crashes, the host computer remains unaffected.   

### Docker
The Docker is a template contatining instructions for creating a container, packaging software in it. A container is a data structure holding objects, storing them according to specific rules.  

## Secrets vs Environment Variables
### Secrets
Secrets comprise all the sensitive data that is not meant to be shared - passwords, certificates, token identification, etc. They are stoked in a hidden file.

### Environment Variables
Enviroment variables help create a reusable configuratio, making the container easier to manage and deploy across environments.

## Docker Network vs Host Network
### Docker Network
Docker Network enables the Docker to communicate between containers and the host machine or external network. In the network, 

### Host Network
Host Network is the network of the host machine the VM is running on.

## Docker Volumes vs Bind Mounts

### Docker Volumes

### Bind Mounts
Bind Mounts can be used to mount source code into the container, which will see the changes as soon as the file is saved. It means that processes can be run in the container, watching for changes in the file system, preventing data loss. If a docker container were to shut down, the bind mounted data should not be lost. 

To compare, Docker Volumes aare easier to back up or migrate than bind mounts. Bind mounts create persisntent volumes on the host machine while docker volumes do it on the docker host. 

# Instructions

# Resources
https://www.docker.com/get-started/
MardDown syntax: https://www.markdownguide.org/basic-syntax/
