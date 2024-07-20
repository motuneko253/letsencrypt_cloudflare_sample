#!/bin/bash

if [ ! -f "/etc/letsencrypt/live/${DOMAIN}/README" ]; then
    echo "$(date +"%Y/%m/%d %H:%M:%S"):${DOMAIN}:certbot start"
    echo "$(date +"%Y/%m/%d %H:%M:%S"):${DOMAIN}:cloudflare.ini make start"
    echo "dns_cloudflare_api_token = ${API_TOKEN}" > /root/cloudflare.ini
    chmod 600 /root/cloudflare.ini
    echo "$(date +"%Y/%m/%d %H:%M:%S"):${DOMAIN}:certbot certonly start"
    certbot certonly \
    -n \
    --agree-tos \
    --dns-cloudflare \
    --dns-cloudflare-credentials /root/cloudflare.ini \
    --dns-cloudflare-propagation-seconds ${WAIT_TIME} \
    --email ${EMAIL} \
    -d ${DOMAIN} \
    -d ${SUBDOMAIN} \
    #--dry-run
    echo "$(date +"%Y/%m/%d %H:%M:%S"):${DOMAIN}:certbot end"
else
    echo "$(date +"%Y/%m/%d %H:%M:%S"):${DOMAIN}:certbot certbot renew start"
    certbot renew
    echo "$(date +"%Y/%m/%d %H:%M:%S"):${DOMAIN}:certbot certbot renew end"
fi
