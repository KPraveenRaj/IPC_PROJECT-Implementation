#!/usr/bin/env bash
set -e

IMAGE_NAME="c3-gpu"

# Build image
docker build -t "$IMAGE_NAME" .

# Run container with:
# - GPU access
# - external HDD mounted to /mnt/ExternalHardDrive inside container
docker run --rm --gpus all -it \
  -v "/media/pandu/External hard drive:/mnt/ExternalHardDrive" \
  "$IMAGE_NAME" bash
