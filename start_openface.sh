#!/bin/bash

# For GUI window
xhost local:root

# https://github.com/TadasBaltrusaitis/OpenFace/wiki/Command-line-arguments
echo "For realtime webcam demo, type below"
echo "./build/bin/FeatureExtraction -device 0"
echo "Check more CML options at https://github.com/TadasBaltrusaitis/OpenFace/wiki/Command-line-arguments"

docker run \
  --rm \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -e SDL_VIDEODRIVER=offscreen \
  -it \
  --gpus all \
  --name openface \
  --mount type=bind,source="$(pwd)/mount",target=/data \
  --device=/dev/video0:/dev/video0:rwm \
  algebr/openface:latest

