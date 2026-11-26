#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y live-build curl ca-certificates xorriso mtools dosfstools

lb clean --binary || true

LB_OPTS=(
    --distribution trixie
    --architectures amd64
    --archive-areas "main contrib non-free non-free-firmware"
    --binary-images iso-hybrid
    --bootloaders "grub-efi,syslinux"
    --debian-installer none
    --apt-recommends true
    --iso-application "Cyrethium Reborn"
    --iso-volume "CYRETHIUM_REBORN"
    --bootappend-live "boot=live components quiet splash"
)

lb config "${LB_OPTS[@]}"
lb build

if [[ -f live-image-amd64.hybrid.iso ]]; then
    OUT_ISO="Cyrethium-Reborn-Trixie-amd64-$(date +%Y%m%d).iso"
    mv live-image-amd64.hybrid.iso "$OUT_ISO"
    sha256sum "$OUT_ISO" > "${OUT_ISO}.sha256"
    chown "${HOST_UID:-1000}:${HOST_GID:-1000}" "$OUT_ISO" "${OUT_ISO}.sha256"
    echo "[OK] ISO gerada: $OUT_ISO"
fi
