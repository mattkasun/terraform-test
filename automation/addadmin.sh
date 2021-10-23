#!/bin/bash
curl -X POST -d '{"username": "admin", "password": "password", "isadmin": true}' \
    -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    "https://api.clustercat.com/api/users/adm/createadmin"
