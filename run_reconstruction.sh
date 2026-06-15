#!/bin/bash
[ -f .env ] && set -a && source .env && set +a
mkdir -p $(pwd)/logs
# Optional: REAL2SIM_AUTO_CLEAN=1 skips the delete prompt; REAL2SIM_SKIP_CLEAN=1 never deletes.
docker run --rm --gpus all -it --shm-size=32g \
  -v /media/karaev/fcb1af03-76fd-49be-9e74-8d3c79436a4c/Datasets/Genie_sim/House:/mnt \
  -v /media/karaev/fcb1af03-76fd-49be-9e74-8d3c79436a4c/Datasets/Genie_sim/difix_model:/root/third_party/Difix3D/hf_model \
  -v $(pwd)/logs:/logs \
  -e REAL2SIM_AUTO_CLEAN="${REAL2SIM_AUTO_CLEAN:-0}" \
  -e REAL2SIM_SKIP_CLEAN="${REAL2SIM_SKIP_CLEAN:-0}" \
  registry.agibot.com/real2sim/cuda:12.8.0-cudnn-devel-ubuntu22.04-benchmark \
  /bin/bash -c "cd /root/third_party/gsplat/examples && bash real2sim_environment_entrypoint.sh /mnt 1"
