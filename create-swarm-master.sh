#!/usr/bin/env bash

if [ -f ".env" ]; then
  source .env;
else
  echo "Error. No configuration available. Create a .env file from .env.example";
  exit 1;
fi

provider=$DOCKER_MACHINE_DRIVER;

echo "Creating swarm master with provider $provider";
docker-machine create \
        -d $provider \
        --swarm \
        --swarm-master \
        --swarm-discovery token://$swarmId \
        swarm-master
