do:
	docker compose up

re:
	docker container prune -f && \
	docker image rm nginx-try:packaged && \
	docker image build --tag nginx-try:packaged . \
	docker image rm wp-try:packaged && \
	docker image build --tag wp-try:packaged . \
	docker image rm mdb-try:packaged && \
	docker image build --tag mdb-try:packaged . \
	docker compose up