#!/usr/bin/env bash

machinePrefix="";

if [ -f ".env" ]; then
  source .env;
else
  echo "Error. No configuration available. Create a .env file from .env.example";
  exit 1;
fi

provider=$DOCKER_MACHINE_DRIVER;

if [ -f ".machine-prefix" ]; then
  machinePrefix=$(<.machine-prefix);
else
  echo "Error. No machine prefix generated. Re-Run create-swarm.sh";
  exit 1;
fi

echo "Creating swarm master with provider $provider";
docker-machine create \
        -d $provider \
        --swarm \
        --swarm-master \
        --swarm-discovery "token://$swarmId" \
        "$machinePrefix-swarm-master"
