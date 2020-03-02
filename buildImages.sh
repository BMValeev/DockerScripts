#!/bin/bash
/home/eadmin/docker/updateDocker.sh
ID=$(docker ps | awk '{if(FNR==2) print $1}')
echo $ID
docker exec -u deploy -it $ID /home/deploy/buildAll.sh

