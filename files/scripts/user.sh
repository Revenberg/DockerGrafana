#!/bin/bash -e

echo "import dashboards task"
sleep 50s

readonly URL=${URL:-"http://localhost:3000"}
readonly LOGIN=${LOGIN:-"admin:admin"}

echo "add user"

passwrd=$(cat /home/pi/.pswrd)
data="name=admin&username=admin&email=admin@locahome&password=admin&active=true,approved=true"

curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"
