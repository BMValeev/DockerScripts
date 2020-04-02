#!/bin/bash
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print 10}')
if [[ "$ID" == "10" ]]; then
echo "then"
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print $1}')
#ID=$(docker ps | awk '{if(FNR==2) print $1}')
echo $ID
docker exec -u deploy -it $ID /home/deploy/update.sh
else
echo "else"
fi
