do:
	docker image rm wp-try:packaged && \
	docker image build --tag wp-try:packaged . && \
	docker run -it --rm --name wp-cont -p 8080:8080 wp-try:packaged /bin/bash

doto: 
	docker image build --tag wp-try:packaged . && \
	docker run -it --rm --name wp-cont -p 8080:8080 wp-try:packaged /bin/bash

reimage: 
		docker image rm wp-try:packaged && \
		docker image build --tag wp-try:packaged .