#!/bin/bash

set -e

docker build -f Dockerfile -t local/monero-miner .

docker rm -f monero-miner 2>/dev/null || echo "No running container to delete"
docker run  --privileged --cap-add=ALL -d -v /dev:/dev -v /lib/modules:/lib/modules -d \
  --name monero-miner local/monero-miner $@
