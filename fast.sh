#!/bin/bash

set -e

if ! command -v docker &>/dev/null
then
    apt-get -y update
    apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

    apt-key fingerprint 0EBFCD88

    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io
fi

systemctl enable docker.service

curl -sL https://raw.githubusercontent.com/le-garff-yoann/monero-miner/le-garff-yoann/run.sh | bash -s -- $@
