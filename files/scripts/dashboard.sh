readonly URL=${URL:-"http://localhost:3000"}
readonly LOGIN=${LOGIN:-"admin:admin"}

dashboard=$(cat $1 | jq ' .id = null' )

data=${echo -e "{\n    \"dashboard\": $dashboard,\n    \"overwrite\": true,\n    \"message\": \"Updated by ansible\"\n}\n"}

curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/dashboards/db -XPOST -d "$data"
