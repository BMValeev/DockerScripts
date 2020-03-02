#!/bin/bash
now=$(date +"%m_%d_%Y")
touch  /home/deploy/yocto/output/nighty/image-camera/logs/build_$now.log
cd /home/deploy/yocto/input/openembedded-core
source oe-init-build-env > /dev/null
echo "Build image"
bitbake image-camera > /home/deploy/yocto/output/nighty/image-camera/logs/build_$now.log
cp /home/deploy/yocto/input/openembedded-core/build/tmp-glibc/deploy/images/solidrun-imx6/image-camera-solidrun-imx6.wic.gz   /home/deploy/yocto/output/nighty/image-camera/image/
cd  /home/deploy/yocto/output/nighty/image-camera/image
echo "Push to gitlab"
git pull origin nighty > /dev/null
git checkout nighty > /dev/null
git add . > /dev/null
git commit -m "nighty build" > /dev/null
git push origin nighty > /dev/null
echo "End camera"
