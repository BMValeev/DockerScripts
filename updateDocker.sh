#!/bin/bash
ID=$(docker ps | awk '{if(FNR==2) print $1}')
echo $ID
docker exec -u deploy -it $ID /home/deploy/update.sh

