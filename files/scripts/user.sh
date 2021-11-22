#!/bin/bash -e

echo "import users task"
sleep 30s

URL=${URL:-"http://localhost:3000"}
LOGIN=${LOGIN:-"admin:admin"}

echo "add adminuser"
data='{ "name": "adminuser", "username": "adminuser", "email": "adminuser@localhome", "password": "adminuser", "active": "true", "approved": "true"}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"

echo "add pi"
passwrd=$(cat /usr/share/.pswrd)
data='{ "name": "pi", "username": "pi", "email": "pi@localhome", "password": "'$passwrd'", "active": "true", "approved": "true"}'
curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"


