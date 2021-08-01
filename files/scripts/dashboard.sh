#!/bin/bash -e

sleep 2m

readonly URL=${URL:-"http://localhost:3000"}
readonly LOGIN=${LOGIN:-"admin:admin"}

map="/etc/grafana/provisioning/dashboards/*"

for f in $map
do    
    dashboard=$(cat $f | jq ' .id = null' )


    data=$(echo -e "{\n    \"dashboard\": $dashboard,\n    \"overwrite\": true,\n    \"message\": \"Updated by init\"\n}\n")

    curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/dashboards/db -XPOST -d "$data"
done
