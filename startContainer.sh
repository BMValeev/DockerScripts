#!/bin/bash
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print 10}')
if [[ "$ID" == "10" ]]; then
echo "then"
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print $1}')
docker exec -it -u root $ID '/home/deploy/sshStart.sh'
echo $ID
else
docker run -it -d -u deploy -p3222:22 deploy-yocto-imx6
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print $1}')
echo $ID
docker exec -it -u root $ID '/home/deploy/sshStart.sh'
echo "else"
fi
#docker run -it -d -u deploy -p3222:22 deploy-yocto-imx6
#ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print $1}')
#IMAGE=$(docker images | awk '{if((FNR>1)&&($1=="deploy-yocto-imx6")) print $3}')
#echo $IMAGE
#ID=$(docker ps | awk '{if((FNR>1)&&($2==$IMAGE)) print $1}')
#echo $ID
#docker exec -it -u root $ID '/home/deploy/sshStart.sh'

