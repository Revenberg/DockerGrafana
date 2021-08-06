#!/bin/bash

git pull
chmod +x build.sh

docker image build -t revenberg/DockerGrafana . 

#docker run -p 3000:3000 revenberg/DockerGrafana

docker push revenberg/DockerGrafana