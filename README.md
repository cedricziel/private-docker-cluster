# Example scripts for managing a simple docker cluster via Docker Swarm

Example scripts to watch and learn.

## Create a cluster

First create a discovery token.

```bash
./create-cluster.sh
```

## Create a swarm master

A swarm master controls the cluster.

```bash
./create-swarm-master.sh
```

## Create a swarm node

A swarm node provides compute power

```bash
./create-swarm-node.sh
```

## Use the cluster

```bash
./control-cluster.sh
```

## License (MIT)

The MIT License - 2016 Cedric Ziel <cedric@cedric-ziel.com>
