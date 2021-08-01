#!/bin/bash

git pull
chmod +x build.sh

docker image build -t revenberg/grafana .

docker push revenberg/grafana
