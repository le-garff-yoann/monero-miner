#!/bin/bash

set -e

docker rm -f monero-miner &>/dev/null || echo 'No running container to delete'
docker run -d --privileged --cap-add=ALL --restart=always \
    --name monero-miner "${MONERO_MINER_IMAGE:-'registry.gitlab.com/le-garff-yoann/monero-miner'}" $@
