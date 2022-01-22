#!/bin/bash

# git fetch --all
# git checkout --force "origin/master"

STATUS=200
MSG="Hi $1, I have been deployed! 🚀"

JSON_RESPONSE=$( jq -n \
  --arg status "$STATUS" \
  --arg msg "$MSG" \
  '{ status: $status|tonumber, message: $msg }' )

echo $JSON_RESPONSE