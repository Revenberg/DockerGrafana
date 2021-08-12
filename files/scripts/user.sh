#!/bin/bash -e

echo "import dashboards task"
sleep 50s

readonly URL=${URL:-"http://localhost:3000"}
readonly LOGIN=${LOGIN:-"pi:pi"}

echo "add user"

passwrd=$(cat /home/pi/.pswrd)
data="name=&username=pi&email=pi@locahome&password=$passwrd&active=true,approved=true"

curl --user "$LOGIN" -H 'Content-Type: application/json' http://localhost:3000/api/admin/users -XPOST -d "$data"
