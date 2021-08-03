#!/bin/bash -e

echo "import dashboards task"
sleep 20s

readonly URL=${URL:-"http://localhost:3000"}
readonly LOGIN=${LOGIN:-"admin:admin"}

map="/etc/grafana/provisioning/dashboards/*"

for f in $map
do    
    dashboard=$(cat $f | jq ' .id = null' )
    echo "import dashboard"

    data=$(echo -e "{\n    \"dashboard\": $dashboard,\n    \"overwrite\": true,\n    \"message\": \"Updated by init\"\n}\n")

    curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/dashboards/db -XPOST -d "$data"
done
