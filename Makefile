up:
	docker-compose up -d --build

down:
	docker-compose down

run:
	docker-compose up --build

install:
	docker exec front yarn install
	docker exec api bundle install

create-db:
	docker-compose run ruby rake db:create

migrate-db:
	docker-compose run ruby rake db:migrate

drop-db:
	docker-compose run ruby rake db:drop

bash:
	docker exec -it api bash

clean-front:
	cd front && \
	rm yarn.lock && \
	rm -rf node_modules && \
	docker exec front yarn install

restart:
	docker restart api
	docker restart front

pretty:
	cd front && \
	prettier --single-quote --trailing-comma es5 --write "**/*.js"
