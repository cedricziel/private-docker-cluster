#!/usr/bin/env bash

# read the configuration
if [ -f ".env" ]; then
  source .env;
else
  echo "Error. No configuration available. Create a .env file from .env.example";
  exit 1;
fi

swarmId=""

if [ -f ".swarm-id" ]; then
  echo "Swarm exists.";
  swarmId=$(<.swarm-id);
else
  echo "Creating swarm";
  docker pull swarm;

  swarmId=$(docker run --rm swarm create);

  failcode=$?
  if [ $failcode != 0 ]; then
    echo "Failure creating swarm token. Exiting.";
    exit 1;
  fi

  echo $swarmId >> .swarm-id;
  machinePrefix=${swarmId:0:5}
  echo $machinePrefix >> .machine-prefix;
fi

echo "Swarm ID is $swarmId";
