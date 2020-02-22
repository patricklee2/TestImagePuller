#!/bin/bash
mkdir "/var/LWASFiles/Sites/testimagepuller/home/site/wwwroot/images"
file="/var/LWASFiles/Sites/testimagepuller/home/site/wwwroot/images/images.json"
#file='/home/patle/TestImagePuller/images/images.json'

content=`docker images --format "{{json . }},"`
if [[ -f "$file" ]]; then
    rm $file
fi

touch $file
echo "{\"images\": [" > $file
echo $content >> $file
echo  "{}]}" >> $file
