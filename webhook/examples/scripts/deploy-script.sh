#!/bin/bash
exec >> $HOME/logs/webhook.log 2>&1

git fetch --all

git pull -f

docker-compose exec -T app-project bash -c "composer install --no-dev && \
  php artisan -vvv cache:clear"

STATUS=200
MSG="Webhook success! 🚀"

JSON_RESPONSE=$( jq -n \
  --arg status "$STATUS" \
  --arg msg "$MSG" \
  '{ status: $status|tonumber, message: $msg }' )

echo $JSON_RESPONSE