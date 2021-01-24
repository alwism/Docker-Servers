#!/bin/bash

cat "config"

for ENV in $(env | grep BAR_SETTING); do
    KEY=$(echo $ENV | sed 's/BAR_SETTING_//g' | cut -d '=' -f1)
    VALUE=$(echo $ENV | sed 's/BAR_SETTING_//g' | cut -d '=' -f2)
    echo "changed setting ${KEY} ${VALUE}"
    sed -i "s/${KEY}=.*/${KEY}=${VALUE}/g" "config"
done

./steamcmd.sh +login anonymous +app_run 1026340 >> /dev/stdout
