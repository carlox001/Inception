# Environment Setup

## Prerequisites

Before running the project, install:
- Docker
- Docker Compose
- GNU Make

## Clone the repository

```bash
git clone <repository_url> inception && \
cd inception
```

## Configuration

Create a `.env` file in the project root.

Example:

```env
MYSQL_DATABASE=wp_database
MYSQL_USER=wp_user

DB_HOST=mariadb:3306
DB_NAME=wp_database
DB_USER=wp_user

DOMAIN_NAME=yourlogin.42.fr
WP_TITLE="Inception"
WP_ADMIN_USER=yourlogin
WP_ADMIN_EMAIL=yourlogin@example.com
WP_USER=wp_user
WP_EMAIL=wp_user@example.com
```

## Secrets

Create the `secrets/` directory:

```bash
mkdir secrets
```

Create one file per secret:

```bash
echo "your_db_password" > secrets/db_password.txt
echo "your_mysql_password" > secrets/mysql_password.txt
echo "your_mysql_root_password" > secrets/mysql_root_password.txt
echo "your_wp_admin_password" > secrets/wp_admin_password.txt
echo "your_wp_password" > secrets/wp_password.txt
```

These files are mounted inside the containers under:

```
/run/secrets/
```

## Start the project

Build and launch the containers:

```bash
make
```

or

```bash
cd srcs && \
docker compose up -d --build
```

## Verify the installation

Check that all containers are running:

```bash
docker ps
```

To inspect a specific service:

```bash
docker logs <service-name>
docker compose logs <service-name>
```

To check the WordPress website visit:

```
https://yourlogin.42.fr
```

and for WordPress administration:

```
https://yourlogin.42.fr/wp-admin
```

To check the MariaDB:

```bash
docker exec -it mariadb mariadb -u root -p
```

and after inserting the password

```SQL
SHOW DATABASES;
```

To check the network :

```bash
docker network ls
docker network inspect <network-name> 
```

To check the volumes :

```bash
docker volume ls
```

# Build and launch the project

## Makefile

Run the Makefile from the root of the project.

To compile the project : 

```bash
make
make all
```

To exit the program and remove the images : 

```bash
make clean
```

To exit the program, remove the images and remove the volumes : 

```bash
make fclean
```

To build only the images : 

```bash
make build
```

To restart the project : 

```bash
make re
```

## Docker Compose

All Docker Compose commands have to be run inside the srcs directory, since the docker-compose.yml file is situated there.

To compile the project and run it in background :

```bash
docker compose up -d --build
```

To exit the program :

```bash
docker compose down
```

To stop the containers without deleting them :

```bash
docker compose stop
```

this way they'll be available and can be restarted later with

```bash
docker compose restart
docker compoe restart <name-of-service>
```


# Manage the containers and volumes

## Managing Continers

To view logs from the services :

```bash
docker compose logs
docker compose logs <name-of-service>
docker compose logs -f # to view them in real time
```

To access a running container:

```bash
docker exec -it <name-of-service> bash
```

To list images:

```bash
docker image ls
docker images
```

To remove unused images :

```bash
docker image prune -f # for dangling images
docker image prune -a -f # for all unused images
```

## Managing  Volumes
 
To list the volumes :

```bash
docker volume ls
```

To see the volume configuration :

```bash
docker volume inspect <volume-name>
```

To remove unused volumes (only Docker volumes, no Bind Mounts) no longer attached to container :

```bash
docker volume prune -f
```

To remove the project including persistent data (only Docker volumes, no Bind Mounts) :

```bash
docker compose down -v
```

## Cleaning the Docker environment

To do a complete cleanup :

```bash
docker system prune -a
sudo rm -rf /home/cazerini/data/wordpress_data
sudo rm -rf /home/cazerini/data/mariadb_data
```

This command removes :
- stopped containers
- unused images
- unused networks
- unused volumes

**!!! This affects all Docker projects on the machine !!!**

# Data storage and persistence

The project uses Docker volumes backed by bind mounts so that the services data persists independently of the containers, for example when running commands like *docker compose down* or deleting images.

There are two persistent storage locations configured :
- wordpress_data : mounted in */var/www/html*, its host path is */home/cazerini/data/wordpress_data*, and it serves to store WordPress installaion files, plugins, themes, uploads and configuration files.
- mariadb_data : mounted in */var/lib/mysql*, its host path is */home/cazerini/data/mariadb_data*, and it serves to store MariaDB database files and user data.

To verify where data is stored :

```bash
docker volume inspect <volume-name>
```

or inspect the host directories directly :

```bash
ls /home/cazerini/data/wordpress_data
ls /home/cazerini/data/mariadb_data
```