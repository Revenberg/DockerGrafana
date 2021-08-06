# DockerGrafana

sudo apt install gnupg2 pass
docker image build -t DockerGrafana  .
docker login -u revenberg
docker image push revenberg/DockerGrafana:latest

docker run revenberg/DockerGrafana


docker exec -it ??? /bin/sh

docker push revenberg/DockerGrafana: