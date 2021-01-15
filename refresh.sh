#!/bin/bash

set -e

docker build -t local/monero-miner .

docker rm -f monero-miner 2>/dev/null || echo "No running container to delete"
docker run -d --name monero-miner local/monero-miner $@
