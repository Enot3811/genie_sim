#!/bin/bash
mkdir -p $(pwd)/logs
docker run --rm --gpus all -it --shm-size=32g \
  -v /media/karaev/fcb1af03-76fd-49be-9e74-8d3c79436a4c/Datasets/Genie_sim/House:/mnt \
  -v /media/karaev/fcb1af03-76fd-49be-9e74-8d3c79436a4c/Datasets/Genie_sim/difix_model:/root/third_party/Difix3D/hf_model \
  -v $(pwd)/logs:/logs \
  registry.agibot.com/real2sim/cuda:12.4.1-cudnn-devel-ubuntu22.04-benchmark \
  /bin/bash -c "cd /root/third_party/gsplat/examples && sh real2sim_environment_entrypoint.sh /mnt 1"
