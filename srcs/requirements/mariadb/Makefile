do:
	docker image rm mdb-try:packaged && \
	docker image build --tag mdb-try:packaged . && \
	docker run -it --rm --name wdb-cont -p 8080:8080 wdb-try:packaged /bin/bash

doto: 
	docker image build --tag mdb-try:packaged . && \
	docker run -it --rm --name mdb-cont -p 8080:8080 wdb-try:packaged /bin/bash

reimage: 
		docker image rm mdb-try:packaged && \
		docker image build --tag mdb-try:packaged .