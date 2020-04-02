#!/bin/bash
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print 10}')
if [[ "$ID" == "10" ]]; then
echo "then"
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print $1}')
echo $ID
docker exec -it -u deploy $ID /bin/bash
else
echo "else"
docker run -it -d -u deploy -p3222:22 deploy-yocto-imx6
ID=$(docker ps | awk '{if((FNR>1)&&(substr($10,0,4)=="3222")) print $1}')
echo $ID
docker exec -it -u deploy $ID /bin/bash
fi
