#!/bin/bash -e

echo "import users task"
sleep 30s

LOGIN=${LOGIN:-"admin:admin"}

echo "add adminuser"
data='{ "name": "adminuser", "login": "adminuser", "email": "adminuser@localhome", "password": "adminuser", "active": true, "approved": true }'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"

data='{"isGrafanaAdmin": true}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users/17/permissions -XPOST -d "$data"


echo "add pi"
passwrd=$(cat /usr/share/.pswrd)
data='{ "name": "pi", "login": "pi", "email": "pi@localhome", "password": "'$passwrd'", "active": true, "approved": true, "isGrafanaAdmin": true}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"
