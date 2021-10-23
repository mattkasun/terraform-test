#!/bin/bash
./server_complete.sh
./addadmin.sh
./addnetwork.sh
access=$( ./addkey.sh | /usr/bin/jq --raw-output '.accessstring')
echo $access
ssh client.clustercat.com ./netclient join --name client -t $access 
