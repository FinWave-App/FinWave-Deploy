#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

API_URL=$(cat ./api_url)

if [ -z "$API_URL" ]
then
  echo -e "${RED}Enter api url into file (./api_url)$NC"
  exit
fi

POSTGRES_PASSWORD=$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-30} | head -n 1)

POSTGRES_PASSWORD=$POSTGRES_PASSWORD API_URL=$API_URL docker-compose up -d

if [[ $? -eq 0 ]]; then
  echo -e "\nFinWave start complited.\nDocker Compose should automatically start containers after system reboot."
else
  echo -e "\n${RED}Start failed.$NC"
fi