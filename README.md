# monero-miner

[![pipeline status](https://gitlab.com/le-garff-yoann/monero-miner/badges/le-garff-yoann/pipeline.svg)](https://gitlab.com/le-garff-yoann/monero-miner/-/commits/le-garff-yoann)

This docker image uses [XMRig](https://github.com/xmrig/xmrig).

## Setup and Run... fast!

Only supported on Debian-like systems ATM.

```bash
curl -sL https://raw.githubusercontent.com/le-garff-yoann/monero-miner/le-garff-yoann/fast.sh | sudo bash
```

## Git clone

```bash
bash run.sh
```

or I want you to build the image locally...

```bash
docker build -f Dockerfile -t local/monero-miner .

MONERO_MINER_IMAGE=local/monero-miner bash run.sh
```
