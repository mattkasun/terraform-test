#!/bin/bash
curl -X POST -d '{"netid":"netmaker", "addressrange":"10.0.0.0/24"}' \
    -H "Content-Type: application/json" -H "Authorization: Bearer masterkey" \
    "https://api.clustercat.com/api/networks" -D -

