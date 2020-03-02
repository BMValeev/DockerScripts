#!/bin/bash
ID=$(docker ps | awk '{if(FNR==2) print $1}')
echo $ID
now=$(date +"%m_%d_%Y")
touch /home/eadmin/logs/build_$now.log
docker commit -m "nighty commit" -a "GitlabAutomatical"  $ID deploy-yocto-imx6
docker rmi $(docker images -f "dangling=true" -q)
