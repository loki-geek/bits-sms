#!/usr/bin/bash
IPGREP=$(ip addr show | grep global | awk '{print $2}')
HOSTIP=${IPGREP%/*}
PUBLIC_IP=$(./find_public_ip.sh)
sed -i "s/ALLOWED_HOSTS=.*/ALLOWED_HOSTS=[\"172.31.35.199\",\"backend-clb-1222397364.ap-south-1.elb.amazonaws.com\",\"$PUBLIC_IP\"]/" webapp/backend/backend/settings.py
cd webapp/
source pyvenv/bin/activate
cd backend/
python manage.py runserver $HOSTIP:8000
