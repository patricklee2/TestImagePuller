#!/bin/bash

#file="/var/LWASFiles/Sites/testimagepuller/home/site/wwwroot/remove/1.req"
file="/home/patle/TestImagePuller/remove/1.req"

if [[ ! -f "$file" ]]; then
      echo "file not found"
      exit
fi

image=`head -n 1 $file`

echo "image:" $image

if [ -z "$image" ]
then
      echo "image is empty"
      exit
fi


docker image rm $image -f

rm -rf $file
