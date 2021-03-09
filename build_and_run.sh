#!/bin/bash
if [ -d "$PWD/app/libs" ]; then
      git -C "$PWD/app/libs" pull
  else
      git -C "$PWD/app" clone https://gitlab.ininrim.it/inrimsi/microservices-libs/base-libs.git libs
fi
if [ ! -f ".env" ]; then
    echo ".env File not found!"
    exit 0
fi
if [ -d "$PWD/app/themes" ]; then
      git -C "$PWD/app/themes" pull
  else
      git -C "$PWD/app" clone https://gitlab.ininrim.it/inrimsi/microservices-libs/formio-italia-theme.git themes
fi
if [ ! -f ".env" ]; then
    echo ".env File not found!"
    exit 0
fi
if [ ! -f ".env-test" ]; then
    echo ".env-test File not found!"
    exit 0
fi
docker-compose -f docker-compose.yml stop
docker-compose -f docker-compose.yml -p forms-inrim up --force-recreate --detach --remove-orphans