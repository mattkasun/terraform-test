#!/bin/bash
curl -X POST -d '{}' \
    -H "Content-Type: application/json" -H "Authorization: Bearer masterkey" \
    "https://api.clustercat.com/api/networks/netmaker/keys" 
