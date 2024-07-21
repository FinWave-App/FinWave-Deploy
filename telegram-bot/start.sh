#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

POSTGRES_PASSWORD=$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-30} | head -n 1)

POSTGRES_PASSWORD=$POSTGRES_PASSWORD docker-compose up -d

if [[ $? -eq 0 ]]; then
  echo -e "\nFinWave Telegram bot start complited.\nDocker Compose should automatically start containers after system reboot."
else
  echo -e "\n${RED}Start failed.$NC"
fi