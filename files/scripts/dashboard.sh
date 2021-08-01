readonly URL=${URL:-"http://localhost:3000"}
readonly LOGIN=${LOGIN:-"admin:admin"}

inp=$1
inp="/etc/grafana/provisioning/dashboards/grafana-gas.json"

dashboard=$(cat $inp | jq ' .id = null' )

echo $dashboard

data=$(echo -e "{\n    \"dashboard\": $dashboard,\n    \"overwrite\": true,\n    \"message\": \"Updated by ansible\"\n}\n")

echo $data

curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/dashboards/db -XPOST -d "$data"
