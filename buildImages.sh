#!/bin/bash
touch /home/eadmin/docker/u11
now=$(date +"%m_%d_%Y")
echo $now >> /home/eadmin/docker/u11
#/home/eadmin/docker/updateDocker.sh >> /home/eadmin/docker/u11
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print 10}')
if [[ "$ID" == "10" ]]; then
echo "then"
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print $1}')
#ID=$(docker ps | awk '{if(FNR==2) print $1}')
echo $ID >> /home/eadmin/docker/u11
docker exec -u deploy -i $ID /home/deploy/buildAll.sh >> /home/eadmin/docker/u11
else
echo "else"
fi

