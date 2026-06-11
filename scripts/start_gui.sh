#!/bin/bash

set -eo pipefail

CURRENT_DIR=$(pwd)

mkdir -p ~/docker/isaac-sim/cache/main/ov
mkdir -p ~/docker/isaac-sim/cache/main/warp
mkdir -p ~/docker/isaac-sim/cache/computecache
mkdir -p ~/docker/isaac-sim/config
mkdir -p ~/docker/isaac-sim/data/documents
mkdir -p ~/docker/isaac-sim/data/Kit
mkdir -p ~/docker/isaac-sim/logs
mkdir -p ~/docker/isaac-sim/pkg
mkdir -p $CURRENT_DIR/source/geniesim/benchmark/saved_task
sudo chown -R 1234:1234 ~/docker/isaac-sim

if [ -f "$CURRENT_DIR/.env" ]; then
    source "$CURRENT_DIR/.env"
fi

if [ -z "$SIM_ASSETS" ]; then
    echo "Error: SIM_ASSETS is not set. Please define it in the .env file."
    exit 1
fi

xhost +local:
docker run -itd --name genie_sim_benchmark \
    --init \
    --user 1234:1234 \
    --env-file $CURRENT_DIR/.env \
    --entrypoint ./scripts/entrypoint.sh \
    --gpus all \
    --network=host \
    --privileged \
    -e "ACCEPT_EULA=Y" \
    -e "PRIVACY_CONSENT=Y" \
    -e DISPLAY \
    -v ~/docker/isaac-sim/cache/main:/isaac-sim/.cache:rw \
    -v ~/docker/isaac-sim/cache/computecache:/isaac-sim/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim/logs:/isaac-sim/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim/config:/isaac-sim/.nvidia-omniverse/config:rw \
    -v ~/docker/isaac-sim/data:/isaac-sim/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim/pkg:/isaac-sim/.local/share/ov/pkg:rw \
    -v /dev/input:/dev/input:rw \
    -v "$SIM_ASSETS":/geniesim/main/source/geniesim/assets:rw \
    -v $CURRENT_DIR:/geniesim/main:rw \
    -w /geniesim/main \
    registry.agibot.com/genie-sim/open_source:latest \
    tail -f /dev/null
