#!/bin/bash
ID=$(docker ps | awk '{if(FNR==2) print $1}')
echo $ID
docker exec -it -u deploy $ID /bin/bash
