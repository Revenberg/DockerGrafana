#!/bin/bash

git pull
chmod +x build.sh

docker image build -t revenberg/dockergrafana . 

#docker run -p 3000:3000 revenberg/dockergrafana

docker push revenberg/dockergrafana