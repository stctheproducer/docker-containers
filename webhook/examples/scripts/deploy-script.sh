#!/bin/bash
git fetch --all

git pull -f

docker-compose exec -T app-project bash -c "composer install --no-dev && \
  php artisan -vvv cache:clear" >> $HOME/logs/app-project.log 2>&1
