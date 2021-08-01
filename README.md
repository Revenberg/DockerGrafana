# solarrs485logger

sudo apt install gnupg2 pass
docker image build -t solarrs485logger  .
docker login -u revenberg
docker image push revenberg/solarrs485logger:latest

docker run revenberg/solarrs485logger


docker exec -it ??? /bin/sh

docker push revenberg/solarrs485logger: