#!/bin/bash

# version 7-8-2021

cd ~/dockergrafana

rc=$(git remote show origin |  grep "local out of date" | wc -l)

if [ $rc -ne "0" ]; then
    git pull
    chmod +x build.sh

    docker image build -t revenberg/grafana . 

    docker push revenberg/grafana
    
    
    # testing: 

    echo "==========================================================="
    echo "=                                                         ="
    echo "=          docker run -p 3000:3000 revenberg/grafana      ="
    echo "=                                                         ="
    echo "==========================================================="
    # docker run -p 3000:3000 revenberg/grafana
fi