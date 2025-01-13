#!/bin/bash

DOCKER_COMPOSE_CMD="docker-compose"
if ! command -v $DOCKER_COMPOSE_CMD &> /dev/null; then
  DOCKER_COMPOSE_CMD="docker compose"
fi

$DOCKER_COMPOSE_CMD stop
