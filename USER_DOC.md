## Table of Services

For this project, the stack provides services such as:
- *Web serving* – NGINX receives HTTP/HTTPS requests and serves the website.
- *Application hosting* – WordPress generates the web pages and handles user interactions.
- *Data storage* – MariaDB stores all of WordPress's persistent data.
- *Containerization* – Docker isolates each service in its own container.
- *Service orchestration* – Docker Compose starts, connects, and manages all the containers together.

## Starting and Stopping the project

To start the project run *make* or *make all* on the terminal at the root of the project and wait a few minutes for the programm to start completely.
To exit the program run *make clean* .

## Accessing the website

To access the website write *https://cazerini.42.fr* on the searchbar. Since the security certificate is self-signed the browser will return a warning, but this website is completely safe, so click on *Advanced Settings* and then *Accept the Risk and Continue*.

To access the administration panel write *https://cazerini.42.fr/wp-admin* on the searchbar, this will open a login page where you'll be able to insert the admin credentials, this way you'll have control over the website, its design, the comments, etc.

Most of the credentials are located in the .env file. Docker Compose reads these variables and passes them to the appropriate containers. This way the sensitive information is separate from the application code and it's easier to change credentials without modifying configuration files.

The passowrds are instead located in a secrets folder, to add a layer of protection, since they are more difficult to access this way. They are declared and exported in the docker-compose.yml file to use during the compilation.

## Checking the status

To check that the services are running correctly, run on the terminal the command *docker ps*, this way you'll be able to check if all the containers are running, their time of creation and their status.

To inspect a specific service you can use the *docker logs <service-name>* or *docker compose logs <service-name>* commands (these logs will also be visible on the terminal when the project is started)

To check the WordPress website simply access to it from the browser and then log in as the administrator

To check the MariaDB container run *docker exec -it mariadb mariadb -u root -p* and insert the root password so that it will open its interface, then run *SHOW DATABASES;* and locate the WordPress database.

To check if the network is working run *docker network ls* and *docker network inspect <network-name>* to see if all the containers are connected.

To check that persistent volumes exist run *docker volume ls*. You should be able to see volumes for MariaDB data and WordPress files 