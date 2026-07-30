*This project has been created as part of the 42 curriculum by cazerini*

# Description

This project is focused on learning Docker and containerization. 

The objective is not just to make applications run in containers, but to understand how different services communicate while remaining isolated from one another.

The project teaches you how to:
- Build and manage Docker images using your own Dockerfiles.
- Orchestrate multiple containers with Docker Compose.
- Configure networking so services communicate securely.
- Persist data using Docker volumes.
- Deploy a secure web application with HTTPS.
- Understand the fundamentals of infrastructure as code and service  isolation.

The project is composed by three containers, each responsible for a single service:
- Nginx – Web server and HTTPS reverse proxy.
- WordPress + PHP-FPM – The web application.
- MariaDB – Database server.

All the images used to create the containers were built from a base Linux distribuition (in this case Debian:13.1)

## What is docker?

It's a tool that allows to create an independent space (the containers) to store the program in, including all the dependencies needed, so that it can be easly run and executed on other devices. They are pretty similiar to Virtual Machines, but have the advantage of not having a high overhead (costs necessary to operate the program).

## Virtual Machines VS Docker

**Virtual Machine**:
- *objective* : it was originally designed to allow multiple operating systems to run on a single physical machine, creating a virtual environment that's isolated from the underlying hardware.
- *virtualization* : a VM provides virtualization of an entire machine (server), emulating the hardware components of a physical machine, such as CPU, memory, network interface card, etc.
- *architecture* : A VM runs its own kernel and host operating system, along with applications and their dependencies. A hypervisor coordinates between the hardware (host machine or server) and the virtual machine.
- *resource sharing* : it requests a specific amount of the resource up-front from the hardware and continue to steadily occupy that amount, so long as the virtual machine is running.
- *security* : since a VM runs an entire OS, there's an added level of isolation that gives higher security (as long as the OS has strict security measures in place)

**Docker**:
- *objective* : it was designed to provide a lightweight and portable way to package and run applications across different environments and operating systems.
- *virtualization* : Docker lets you run an application on any operating system, using isolated user-space instances known as containers. Docker containers have their own file system, dependency structure, processes and network capabilities. 
- *architecture* : Docker container uses the underlying host operating system kernel resources directly.
- *resource sharing* : it uses resources on demand from the single operating system kernel, so it also may use less system resources than a VM.
- *system* : since Docker containers share the kernel with the host operating system, they're at risk if there are vulnerabilities in the kernel.

## Secrets VS Environment Variables

An *environment variable* is a named value the operating system makes available to a running process. It is a delivery mechanism, a way to pass configuration into an app at startup without baking it into the code. 

A *secret* is a sensitive value that grants access and must stay confidential.

The main difference between the two is the level of security they have. An env file can be passed around and, if handled incorrectly, can be read by every process the user runs.
Secrets, on the other hand, need encryption at rest and in transit and access control, thus making it way more secure.

## Docker Network VS Host Network

The difference between Docker and Host networks lies in the isolation and how the containers comunicate.

**Docker network**:
- *objetive* : useful when running multiple services that comunicate with each other
- *isolation* : the container has its own network namespace, which improves security
- *IP address* : has its own
- *performance* : slight networking overhead

**Host network**:
- *objective* : useful when we need the lowest possible networking overhead and the application expects direct access to the host's network
- *isolation* : the container shares the host's network namespace
- *IP address* : it uses the host's
- *performance* : slightly faster since it has no NAT

## Docker Volumes VS Bind Mounts

Docker offers two main options for data storage and its persistence and the way its shared between the Host and the containers: Volumes and Bind Mounts.
They are necessary because containers are isolated and insipendent, so they do not have direct acces to the Host's files.

**Volumes**:
- *objective* : used when we need the data to persist even after the container is stopped
- *managing* : Docker Daemon, so we don't work directly on the files.
- location on Host : we have an isolated path ( in this case */home/cazerini/data*)
- *portability* : high, works in every environment.
- *security* : its data is isolated from the Host's OS.
- *performance* : optimized, since the drives are Docker native

B**ind Mount**:
- *objective* : when there are files or directories that we want to share directly with the container
- *managing* : the user/host manages the paths and permissions to access the files
- location on Host : any arbitrary path
- *portability* : low, it depends on the Host directories' structure
- *security* : there's no isolation, so if badly handled the container can modify system files
- *performance* : depends on the OS (because of the virtualization)  


# Istructions

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

To give a general explanation on what is happening when running the *make re* command (which is a combination of the *make clean* and *make all*) :
- enter the srcs directory
- run *docker-compose down* to ensure that there aren't other processes running already
- removes the all images
- removes the all networks
- removes all the volumes created
- recreate the directories to store the volumes in
- run the *docker-compose up -d --build* command which build all the images, to create the containers, and execute the program in background

After all this, we can acces to the website trought the domain name *cazerini.42.fr*

# Resources

Here's a list of documentation and articles used to understand and write the code for this project:
- Docker for beginners (https://docker-curriculum.com/) to understand how docker works and learn the basic for commands, immages, containers and Docker Compose
- Nginx beginner's guide (https://nginx.org/en/docs/beginners_guide.html) to study how nginx configuration file works
- MariaDB official site (https://mariadb.org/) to understand better some specific topics (like how to properly configure an healtcheck)

To clear up confusion about some parts of the code I have used other sites, like Stack Overflow, AI tools (stricktly for research purposes) and of course the help of my peers.

