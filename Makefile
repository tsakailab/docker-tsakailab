YML = docker-compose.yml

setup:
        @make build
        @make up
        @make ps
down:
        docker-compose down
up:
        docker-compose -f ${YML} up -d
build:
        docker-compose -f ${YML} build
ps:
	docker-compose ps
check:
        docker ps -a
        docekr images
        docker system df
        nvidia-smi
clean:
        docker system prune -f
        docker container prune -f
        docker image prune -f
        docker volume prune -f
        docker network prune -f
