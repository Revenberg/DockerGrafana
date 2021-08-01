#!/bin/bash

git pull
chmod +x build.sh

docker image build -t revenberg/grafana . 

#docker run -p 3000:3000 revenberg/grafana

docker push revenberg/grafana