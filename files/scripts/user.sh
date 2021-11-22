#!/bin/bash -e

echo "import users task"
sleep 30s

LOGIN=${LOGIN:-"admin:admin"}

echo "add adminuser"
data='{ "name": "adminuser", "login": "adminuser", "email": "adminuser@localhome", "password": "adminuser", "active": true, "approved": true }'

rc=$( curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data" )
id=$(echo $rc | cut -d':' -f2 | cut -d',' -f1)

data='{"role":"Admin"}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/orgs/1/users/$id -XPATCH -d "$data"


echo "add pi"
passwrd=$(cat /usr/share/.pswrd)
data='{ "name": "pi", "login": "pi", "email": "pi@localhome", "password": "'$passwrd'", "active": true, "approved": true, "isGrafanaAdmin": true}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"

rc=$( curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data" )
id=$(echo $rc | cut -d':' -f2 | cut -d',' -f1)

data='{"role":"Admin"}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/orgs/1/users/$id -XPATCH -d "$data"
