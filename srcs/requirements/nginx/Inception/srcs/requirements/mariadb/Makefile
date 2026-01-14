do:
	docker image rm wdb-try:packaged && \
	docker image build --tag wdb-try:packaged . && \
	docker run -it --rm --name wdb-cont -p 8080:8080 wdb-try:packaged /bin/bash

doto: 
	docker image build --tag wdb-try:packaged . && \
	docker run -it --rm --name wdb-cont -p 8080:8080 wdb-try:packaged /bin/bash

reimage: 
		docker image rm wdb-try:packaged && \
		docker image build --tag wdb-try:packaged .