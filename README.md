# DockerGrafana

sudo apt install gnupg2 pass
docker image build -t DockerGrafana  .
docker login -u revenberg
docker image push revenberg/dockergrafana:latest

docker run revenberg/dockergrafana


docker exec -it ??? /bin/sh

docker push revenberg/dockergrafana: