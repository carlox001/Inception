do:
	docker image rm nginx-try:packaged && \
	docker image build --tag nginx-try:packaged . && \
	docker run -it --rm --name nginx-cont -p 443:443 nginx-try:packaged /bin/bash

doto: 
	docker image build --tag nginx-try:packaged . && \
	docker run -it --rm --name nginx-cont -p 443:443 nginx-try:packaged /bin/bash

reimage:
		docker image rm nginx-try:packaged && \
		docker image build --tag nginx-try:packaged .