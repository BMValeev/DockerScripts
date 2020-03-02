#!/bin/bash
now=$(date +"%m_%d_%Y")
touch  /home/deploy/yocto/output/nighty/$1/logs/build_$now.log
cd /home/deploy/yocto/input/openembedded-core
source oe-init-build-env
bitbake $1 > /home/deploy/yocto/output/nighty/$1/logs/build_$now.log
cp /home/deploy/yocto/input/openembedded-core/build/tmp-glibc/deploy/images/solidrun-imx6/$1-solidrun-imx6.wic.gz   /home/deploy/yocto/output/nighty/$1/image/
cd  /home/deploy/yocto/output/nighty/$1/image
git pull origin nighty
git checkout nighty
git add .
git commit -m "nighty build"
git push origin nighty
