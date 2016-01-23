#!/usr/bin/env bash

# read the configuration
source .env;

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
fi

echo "Swarm ID is $swarmId";
