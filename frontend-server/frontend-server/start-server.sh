#!/usr/bin/bash

aws ec2 describe-instances | grep -E 'PublicIpAddress|Value' | awk '{$1=$1};1' | tr -d '\n"' | tr ',' ' ' > publicIp.txt
BACKEND_IP=$(sed 's/PublicIpAddress/\n&/g' publicIp.txt | grep backend | awk '{print $2}')
#sed -i "s/http:\/\/.*/http:\/\/$BACKEND_IP:8000\/students\'/g" webapp/frontend/src/services/StudentService.js
cd webapp/frontend/
npm start
