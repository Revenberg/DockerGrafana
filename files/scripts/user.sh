#!/bin/bash -e

echo "import dashboards task"
sleep 30s

readonly URL=${URL:-"http://localhost:3000"}
readonly LOGIN=${LOGIN:-"admin:admin"}

data="name=admin&username=admin&email=admin@localhome&password=admin&active=true,approved=true"
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"

echo "add adminuser"
data='{ "name": "adminuser", "username": "adminuser", "email": "adminuser@localhome", "password": "adminuser", "active": "true", "approved": "true"}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"

echo "add pi"
passwrd=$(cat /usr/share/.pswrd)
data='{ "name": "pi", "username": "pi", "email": "pi@localhome", "password": "$passwrd", "active": "true", "approved": "true"}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"


