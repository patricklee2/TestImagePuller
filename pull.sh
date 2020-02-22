#!/bin/bash
mkdir "/var/LWASFiles/Sites/testimagepuller/home/site/wwwroot/pullandtag"
file="/var/LWASFiles/Sites/testimagepuller/home/site/wwwroot/pullandtag/1.req"
#file="/home/patle/TestImagePuller/pullandtag/1.req"

if [[ ! -f "$file" ]]; then
      echo "file not found"
      exit
fi

source=`head -n 1 $file`
tag=`head -n 2 $file | tail -n 1`

echo "source:" $source
echo "tag:" $tag

if [ -z "$source" ]
then
      echo "source is empty"
      exit
fi

if [ -z "$tag" ]
then
      echo "tag is empty"
      exit
fi

docker pull $source
docker tag $source $tag

rm -rf $file
