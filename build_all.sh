#!/bin/bash

# Настраиваем логирование: весь вывод будет идти и в консоль, и в файл
LOG_FILE="build_containers_$(date +%Y%m%d_%H%M%S).log"
echo "Starting build process. All output will be logged to $LOG_FILE"
exec > >(tee -a "$LOG_FILE") 2>&1

WORKSPACE_DIR=$(pwd)

echo "========================================"
echo "1. Building Genie Sim (isaac) container"
echo "========================================"
cd "$WORKSPACE_DIR"
IMAGE_1="registry.agibot.com/genie-sim/open_source:latest"
if docker image inspect "$IMAGE_1" >/dev/null 2>&1; then
    echo "Image $IMAGE_1 already exists. Skipping build."
else
    if docker build -f ./scripts/dockerfile -t "$IMAGE_1" .; then
        echo "Genie Sim container built successfully!"
    else
        echo "ERROR: Failed to build Genie Sim container. Moving to the next one..."
    fi
fi

echo "========================================"
echo "2. Building openpi container"
echo "========================================"
cd "$WORKSPACE_DIR/openpi"
IMAGE_2="openpi_server"
if docker image inspect "$IMAGE_2" >/dev/null 2>&1; then
    echo "Image $IMAGE_2 already exists. Skipping build."
else
    # Скачиваем базовый образ, как указано в гайде
    docker pull nvcr.io/nvidia/cuda@sha256:2d913b09e6be8387e1a10976933642c73c840c0b735f0bf3c28d97fc9bc422e0
    # Собираем образ
    if docker compose -f scripts/docker/compose.yml build; then
        echo "openpi container built successfully!"
    else
        echo "ERROR: Failed to build openpi container. Moving to the next one..."
    fi
fi

echo "========================================"
echo "3. Building scene_reconstruction container"
echo "========================================"
cd "$WORKSPACE_DIR/source/scene_reconstruction"
IMAGE_3="registry.agibot.com/real2sim/cuda:11.8.0-cudnn8-devel-ubuntu22.04-benchmark"
if docker image inspect "$IMAGE_3" >/dev/null 2>&1; then
    echo "Image $IMAGE_3 already exists. Skipping build."
else
    # Тег взят из команды docker run в гайде
    if docker build . -t "$IMAGE_3"; then
        echo "scene_reconstruction container built successfully!"
    else
        echo "ERROR: Failed to build scene_reconstruction container."
    fi
fi

echo "========================================"
echo "Build script execution finished!"
echo "Check $LOG_FILE for details."
echo "========================================"
