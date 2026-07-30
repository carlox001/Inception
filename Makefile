all:
	mkdir -p /home/cazerini/data/wordpress_data
	mkdir -p /home/cazerini/data/mariadb_data
	cd srcs && \
	docker compose up -d --build

build:
	cd srcs  && \
	cd requirements/nginx  && \
	docker image build --tag nginx-try:packaged . && \
	cd ../wordpress  && \
	docker image build --tag wp-try:packaged . && \
	cd ../mariadb  && \
	docker image build --tag mdb-try:packaged .  && \

clean:
	cd srcs  && \
	docker compose down
	docker image prune -a -f
	docker network prune -f 

fclean:
	cd srcs && \
	docker compose down
	docker image prune -a -f 
	docker network prune -f
	sudo rm -rf /home/cazerini/data/wordpress_data
	sudo rm -rf /home/cazerini/data/mariadb_data


re: clean all


