#!/bin/sh

until [ "$response" = "status: done" ]
do
    response=$(ssh server.clustercat.com cloud-init status)
    echo $response
    sleep 10
done

