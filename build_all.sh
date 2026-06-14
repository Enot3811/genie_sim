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
# Multi-stage Dockerfile:
#   colmap-builder  — CUDA 11.8 (legacy colmap-pcd)
#   gsplat-builder  — CUDA 12.8 + cu128 PyTorch (final image, RTX 50xx)
# Set FORCE_REBUILD=1 to rebuild after Dockerfile/patch changes (e.g. tool.py).
SCENE_RECON_DIR="$WORKSPACE_DIR/source/scene_reconstruction"
IMAGE_3="registry.agibot.com/real2sim/cuda:12.8.0-cudnn-devel-ubuntu22.04-benchmark"
FORCE_REBUILD="${FORCE_REBUILD:-0}"

cd "$SCENE_RECON_DIR"
if docker image inspect "$IMAGE_3" >/dev/null 2>&1 && [ "$FORCE_REBUILD" != "1" ]; then
    echo "Image $IMAGE_3 already exists. Skipping build."
    echo "  To rebuild after changes: FORCE_REBUILD=1 ./build_all.sh"
else
    if [ "$FORCE_REBUILD" = "1" ]; then
        echo "FORCE_REBUILD=1: removing existing image (if any) and rebuilding."
        docker rmi "$IMAGE_3" 2>/dev/null || true
    fi
    if docker build --target gsplat-builder -t "$IMAGE_3" .; then
        echo "scene_reconstruction container built successfully!"
    else
        echo "ERROR: Failed to build scene_reconstruction container."
    fi
fi

echo "========================================"
echo "4. Building data_collection container"
echo "========================================"
cd "$WORKSPACE_DIR/source/data_collection"
IMAGE_4="registry.agibot.com/genie-sim/open_source-data-collection:latest"
if docker image inspect "$IMAGE_4" >/dev/null 2>&1; then
    echo "Image $IMAGE_4 already exists. Skipping build."
else
    if docker build -f ./dockerfile -t "$IMAGE_4" .; then
        echo "data_collection container built successfully!"
    else
        echo "ERROR: Failed to build data_collection container."
    fi
fi

echo "========================================"
echo "Build script execution finished!"
echo "Check $LOG_FILE for details."
echo "========================================"
