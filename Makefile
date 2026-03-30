
do:
	cd srcs/requirements/nginx && \
	docker image build --tag nginx-try:packaged . && \
	cd ../wordpress && \
	docker image build --tag wp-try:packaged . && \
	cd ../mariadb && \
	docker image build --tag mdb-try:packaged . && \
	cd ../.. && \
	docker compose up

re:
	cd srcs && \
	docker container prune -f && \
	docker image rm nginx-try:packaged && \
	docker image build --tag nginx-try:packaged . &&\
	docker image rm wp-try:packaged && \
	docker image build --tag wp-try:packaged . &&\
	docker image rm mdb-try:packaged && \
	docker image build --tag mdb-try:packaged . &&\
	docker compose up