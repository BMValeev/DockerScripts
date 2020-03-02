#!/bin/bash
docker run -it -d -u deploy -p3222:22 deploy-yocto-imx6
ID=$(docker ps | awk '{if(FNR==2) print $1}')
echo $ID
docker exec -it -u root $ID '/home/deploy/sshStart.sh'

