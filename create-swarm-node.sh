#!/usr/bin/env

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

nodeId=$(uuidgen);
echo "Creating node $nodeId on provider: $provider";

docker-machine create \
  -d $provider \
  --swarm \
  --swarm-discovery "token://$swarmId" \
  "$machinePrefix-swarm-node-$nodeId"
