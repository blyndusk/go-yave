#!/bin/bash

read -p "Reset EVERYTHING before start ? [Y/n]: " -n 1 -r YN
if [[ $YN =~ ^[Yy]$ || $YN = "" ]] ; then
  docker-compose up \
  # containers run in background
  --detach \
  # build images
  --build \
  # remove not attached/useless images
  --remove-orphans \
  # delete then recreate all containers
  --force-recreate \
  # delete then recreate all volumes
  --renew-anon-volumes \
  # delete the recreate all dependancies
  --always-recreate-deps

else
printf "\n"
  docker-compose up \
    --detach
fi