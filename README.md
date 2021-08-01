# grafana

sudo apt install gnupg2 pass
docker image build -t grafana  .
docker login -u revenberg
docker image push revenberg/grafana:latest

docker run revenberg/grafana


docker exec -it ??? /bin/sh

docker push revenberg/grafana: