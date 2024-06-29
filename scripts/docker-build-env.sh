#!/usr/bin/env bash

DOCKER_USER=${USER}
BUILD_DIR=/home/${DOCKER_USER}/firmware-open
GIT_NAME="Sravan Balaji"
GIT_EMAIL="balajsra@umich.edu"

docker buildx build \
    -f ./docker/Dockerfile \
    --tag system76-firmware-open-build-env:latest \
    --build-arg="USER=${DOCKER_USER}" \
    --build-arg="BUILD_DIR=${BUILD_DIR}" \
    --build-arg="GIT_NAME=${GIT_NAME}" \
    --build-arg="GIT_EMAIL=${GIT_EMAIL}" \
    .

docker run -it \
    --volume .:${BUILD_DIR} \
    system76-firmware-open-build-env:latest \
    /bin/bash
