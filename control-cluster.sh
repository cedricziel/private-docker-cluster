#!/usr/bin/env bash

machinePrefix="";
swarmId="";
provider="";

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

if [ -f ".swarm-id" ]; then
  swarmId=$(<.swarm-id);
else
  echo "Error. No swarm id present. Re-Run create-swarm.sh";
  exit 1;
fi

echo "You are going to control the currently present cluster, execute";
echo "$(docker-machine env --swarm $machinePrefix-swarm-master)";
