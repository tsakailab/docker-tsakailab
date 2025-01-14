YML = docker-compose.yml

setup:
	@make build
	@make up
	@make ps
down:
	docker-compose down
up:
	docker-compose -f ${YML} up -d
restart:
	sudo systemctl restart docker
	@make down
	@make up
build:
	bash ./scripts/setDotEnv.sh
	docker-compose -f ${YML} build
ps:
	docker-compose ps
check:
	docker ps -a
	docker images
	docker system df
clean:
	docker system prune -f
	docker container prune -f
	docker image prune -f
	docker volume prune -f
	docker network prune -f
