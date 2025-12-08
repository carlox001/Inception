do:
	docker image rm my-wp:pack && \
	docker image build --tag my-wp:pack . && \
	docker run -it --rm --name wp-cont -p 8080:8080 my-wp:pack /bin/bash

doto: 
	docker image build --tag my-wp:pack . && \
	docker run -it --rm --name wp-cont -p 8080:8080 my-wp:pack /bin/bash