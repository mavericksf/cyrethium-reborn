#!/usr/bin/env bash
set -euo pipefail

HOST_UID="$(id -u)"
HOST_GID="$(id -g)"

PODMAN_OPTS=(
    --rm
    --privileged
    --network=host
    --dns=9.9.9.9
    --dns=1.1.1.1
    -e "HOST_UID=$HOST_UID"
    -e "HOST_GID=$HOST_GID"
    -v "$PWD:/build"
    -w /build
)

sudo podman run "${PODMAN_OPTS[@]}" docker.io/library/debian:trixie bash /build/scripts/build-in-container.sh
